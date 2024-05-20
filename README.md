# OOP-Project-Y2S1

## Online E-shopping Store for Baby Care and Products

Welcome to our Online E-shopping Store for Baby Care and Products! This project is designed to offer a seamless and efficient shopping experience for parents and caregivers looking for baby care items. Built using Java and Object-Oriented Programming (OOP) concepts, and deployed on Apache Tomcat, this web application exemplifies robust backend development and a user-friendly interface.

## Features

- **User Registration and Authentication**: Secure user registration and login functionalities.
- **Product Catalog**: Detailed product listings with categories, descriptions, and prices.
- **Product Management**: Add, edit, and delete products.
- **Search Functionality**: Efficient search feature to find products quickly.

## Technologies Used

- **Java**: Core language for the backend development.
- **Servlets and JSP**: For handling HTTP requests and responses.
- **Apache Tomcat**: Web server and servlet container.
- **MySQL**: Database management system for storing user and product information.
- **HTML/CSS**: For structuring and styling the web pages.
- **JavaScript**: For dynamic content and client-side validations.
- **Bootstrap**: Framework for responsive and modern UI design.

## Installation and Setup

### Prerequisites

- Java Development Kit (JDK)
- Apache Tomcat
- MySQL

## Screenshots

<p align="center">
  <img id="mainImage" src="https://github.com/Duvini/OOP-Project-Y2S1/assets/121706197/b3eb6a78-4a21-4872-a1e3-55c8b98cd5ee" width="600">
</p>

<div id="hiddenImages" style="display:none;">
  <p align="center">
    <img src="https://github.com/Duvini/OOP-Project-Y2S1/assets/121706197/23aad96b-b2b0-461b-a0c6-4069b2ca3050" width="600">
    <img src="https://github.com/Duvini/OOP-Project-Y2S1/assets/121706197/1f4be33a-6ef0-4c05-89f0-4928faa88802" width="600">
    <!-- Add more images here -->
  </p>
</div>

<p align="center"><button id="viewMoreButton" onclick="toggleImages()">View More</button></p>

<script>
function toggleImages() {
  var hiddenImages = document.getElementById("hiddenImages");
  var viewMoreButton = document.getElementById("viewMoreButton");
  
  if (hiddenImages.style.display === "none") {
    hiddenImages.style.display = "block";
    viewMoreButton.textContent = "View Less";
  } else {
    hiddenImages.style.display = "none";
    viewMoreButton.textContent = "View More";
  }
}
</script>
