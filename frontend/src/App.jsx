import { useEffect, useState } from "react";

import "./App.css";

function App() {
  const [categories, setCategories] = useState([]);
  const [courses, setCourses] = useState([]);
  const [selectedCategory, setSelectedCategory] = useState(null);
  useEffect(() => {
    const fetchCategories = async () => {
      try {
        const response = await fetch("http://localhost/api/api.php/categories");
        const data = await response.json();
        setCategories(data);
      } catch (error) {
        console.error("Error fetching categories:", error);
      }
    };
    fetchCategories();
  }, []);
  useEffect(() => {
    const fetchCourses = async () => {
      try {
        const response = await fetch("http://localhost/api/api.php/courses");
        const data = await response.json();
        setCourses(data);
      } catch (error) {
        console.error("Error fetching categories:", error);
      }
    };
    fetchCourses();
  }, []);
  const countCourses = (categoryId) => {
    let count = courses.filter(
      (course) => course.category_id === categoryId
    ).length;
    const childCategories = categories.filter(
      (category) => category.parent === categoryId
    );
    childCategories.forEach((child) => {
      count += countCourses(child.id);
    });
    return count;
  };
  const getMainCategoryName = (categoryId) => {
    let category = categories.find((cat) => cat.id === categoryId);
    while (category && category.parent) {
      category = categories.find((cat) => cat.id === category.parent);
    }
    return category ? category.name : "";
  };
  const handleCategoryClick = (categoryId) => {
    setSelectedCategory(categoryId);
  };
  const clearFilter = () => {
    setSelectedCategory(null);
  };
  const filteredCourses = selectedCategory
    ? courses.filter((course) => {
        let category = categories.find((cat) => cat.id === course.category_id);
        while (category && category.parent) {
          if (category.parent === selectedCategory) return true;
          category = categories.find((cat) => cat.id === category.parent);
        }
        return course.category_id === selectedCategory;
      })
    : courses;

  const getAllSubCategories = (categoryId) => {
    const subCategories = categories.filter((sub) => sub.parent === categoryId);
    return subCategories.reduce((acc, sub) => {
      return [...acc, sub, ...getAllSubCategories(sub.id)];
    }, []);
  };
  console.log(categories);
  console.log(courses);

  return (
    <div className='  mx-auto'>
      <h1 className='text-center m-4'>Catalog Course</h1>
      <div className=' container mx-auto   grid grid-cols-8  md:gap-4 p-4 text-start h-full '>
        <div className='flex flex-wrap sm:flex-col sm:col-span-2  col-span-8 mx-auto text-sm lg:text-base'>
          {categories.map((category) => (
            <div key={category.id}>
              {!category.parent && (
                <div className='m-3 sm:m-1'>
                  <ul>
                    <span
                      className='cursor-pointer font-semibold'
                      onClick={() => handleCategoryClick(category.id)}
                    >
                      {category.name}{" "}
                    </span>
                    <span className='text-xs text-gray-500'>
                      {countCourses(category.id) > 0 &&
                        "(" + countCourses(category.id) + ")"}
                    </span>

                    {getAllSubCategories(category.id).map((sub) => (
                      <li
                        key={sub.id}
                        onClick={() => handleCategoryClick(sub.id)}
                        className='ml-5 cursor-pointer'
                      >
                        {" "}
                        {sub.name}{" "}
                        <span className='text-xs text-gray-500'>
                          {" "}
                          {countCourses(sub.id) > 0 &&
                            "(" + countCourses(sub.id) + ")"}{" "}
                        </span>{" "}
                      </li>
                    ))}
                  </ul>
                </div>
              )}
            </div>
          ))}
        </div>
        <div className='sm:col-span-6 col-span-8 h-full m-auto  '>
          <div className=' grid lg:grid-cols-3 gap-y-4 lg:gap-x-8 gap-x-0 md:grid-cols-1 '>
            {filteredCourses.length > 0 ? (
              filteredCourses.map((course) => (
                <div
                  className='relative rounded-md  text-black  bg-slate-100 '
                  key={course.course_id}
                >
                  <div className='absolute top-0 right-0 bg-white text-black p-1 m-2 rounded-md shadow-md'>
                    {" "}
                    {getMainCategoryName(course.category_id)}{" "}
                  </div>
                  <div className='rounded-t-lg'>
                    <img
                      className='block w-100 rounded-t-md'
                      src={course.image_preview}
                      alt={course.title}
                    />
                  </div>
                  <div className='m-3'>
                    <h3 className='line-clamp-1 font-semibold'>
                      {course.title}
                    </h3>
                    <p className='lg:line-clamp-2 font-medium text-sm'>
                      {course.description}
                    </p>
                  </div>
                </div>
              ))
            ) : (
              <div className='w-100  lg:w-[932px] flex flex-col justify-center items-center h-full'>
                {" "}
                <div className='m-5'>No Data Available</div>{" "}
                <button
                  onClick={clearFilter}
                  className=' text-white px-4 py-2 border-white rounded-md'
                >
                  {" "}
                  Clear Filter{" "}
                </button>{" "}
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}

export default App;
