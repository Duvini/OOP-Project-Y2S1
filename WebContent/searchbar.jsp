<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HTML Search Bar Example</title>
<style>
input{
color:black;
}
h1 {
color: black;
}
.search-container {
display: flex;
align-items: center;
max-width: 800px;
margin: 30px auto;
background-color: #7D7C83;
border: 1px solid white;
border-radius: 10px;
padding: 3px;
color:black;
}
input[type="text"] {
flex: 1;
padding: 8px;
border: none;
color:black;
border-radius: 5px 0 0 5px;
}
.searchbtn {
padding: 8px 15px;
background-color: #5cb85c;
color: black;
border: none;
border-radius: 0 5px 5px 0;
cursor: pointer;
}
button:hover {
background-color: #658E5E ;
}
</style>
</head>
<body>

<form onsubmit="searchFunction(event)">
<div class="search-container">
<input type="text" id="search" name="q" placeholder="Search Here .......">
<button type="submit" class="searchbtn">Search</button>
</div>
<script>
function searchFunction(event) {
	event.preventDefault();
	const searchTerm = document.getElementById('search').value;
	// You can perform further actions with the search term, like sending it to a server or processing it locally.
	console.log('Search term:', searchTerm);
	}
</script>
</form>
</body>
</html>