<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <title>footer</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,500;1,400&display=swap');
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    list-style-type: none;
      font-family: 'Poppins', sans-serif;
}
article,aside,figure,footer,header,hgroup,nav,section {
    display: block;
}
body{
    line-height: 1.5;
    font-family: 'Poppins', sans-serif;
}
.container{
    max-width: 1170px;
    margin: auto;
}
.row{
    display: flex;
    flex-wrap: wrap;
}
.footer{
    background-color: #EDE9E6;
    padding: 50px 0;
}
.footer-col{
    width: 25%;
    padding: 0 15px;
}
.footer-col h4{
    font-size: 18px;
    color: #7F5C42;
    text-transform: capitalize;
    margin-bottom: 35px;
    font-weight: 500;
    position: relative;
}
.footer-col h4::before{
    content: '';
    position: absolute;
    left: 0;
    bottom: -10px;
    background-color: #e91e63;
    height: 2px;
    width: 50px;
}
.fotter-col ul li:not(:last-child){
    margin-bottom: 10px;
}
.footer-col ul li a{
    font-size: 16px;
    text-transform: capitalize;
    color:#7F5C42;
    text-decoration: none;
    font-weight: 300;
    color: #69064;
    display: block;
    transition: all 0.3s ease;
}
.footer-col ul li a:hover{
    color: #CAAE87;
    padding-left: 10px;
}
.footer-col .social-links a{
    display: inline-block;
    height: 40px;
    width: 40px;
    background-color: rgba(255,255,255,0.2);
    margin:0 10px 10px 0;
    text-align: center;
    line-height: 40px;
    border-radius: 50%;
    color:#CAAE87 ;
}
.footer-col .social-links a:hover{
    color: #CAAE87;
    background-color: #fff;
}

/* responsive */
@media(max-width:767px){
    .footer-col{
        width: 50%;
        margin-bottom: 30px;
    }
}
@media(max-width:574px){
    .footer-col{
        width: 100%;
    }
}

</style>
</head>
<body>

    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="footer-col">
                    <h4>Company</h4>
                        <ul>
                            <li><a href="#">about us</a></li>
                            <li><a href="#">our services</a></li>
                            <li><a href="#">privacy policy</a></li>

                        </ul>
                    
                </div>
                <div class="footer-col">
                    <h4>Get Help</h4>
                        <ul>
                            <li><a href="#">FAQ</a></li>
                            <li><a href="#">returns</a></li>
                            <li><a href="#">order status</a></li>
                            <li><a href="#">payment options</a></li>
                        </ul>
                    
                </div>
                <div class="footer-col">
                    <h4>online shop</h4>
                        <ul>
                            <li><a href="#">Food</a></li>
                            <li><a href="#">Sanitary & Hygiene</a></li>
                            <li><a href="#">Equipments</a></li>
                        </ul>
                    
                </div>
                <div class="footer-col">
                    <h4>follow us</h4>
                        <div class="social-links">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-youtube"></i></a>
                        </div>
                    
                </div>
            </div>
        </div>
    </footer>
    
</body>
</html>