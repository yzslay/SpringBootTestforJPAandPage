<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
System.out.println(basePath);%> 
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Website</title>
    <!--stylesheet-->
    <link rel="stylesheet" type="text/css" href="${basePath}/EEIT3101/css/Member/style.css">
    <!--light-slider-css-->
    <link rel="stylesheet" type="text/css" href="${basePath}/EEIT3101/css/Member/lightslider.css">
    <!--jQuery-------->
    <!-- <script src="${basePath}/EEIT3101/js/Member/jQuery.js"></script> -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
			integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
			crossorigin="anonymous"></script>
    <!--light-slider-js-->
    <script src="${basePath}/EEIT3101/js/Member/lightslider.js"></script>

    <!--fav-icon------------------->
    <link rel="shortcut icon" href="${basePath}/EEIT3101/images/Member/fav-icon.ico" />
    <!--using-FontAwesome-for-Icons-->
    <script src="https://kit.fontawesome.com/c8e4d183c2.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>

    <style>
        .hide {
            visibility: hidden;
        }

        .show {
            visibility: visible;
        }

        .loadText {
            font-size: 30px;
            margin-top: 50px;
        }

        .div {
            margin: 60px auto;
            width: 600px;
        }

        h1 {
            margin-top: 205px;
            text-align: center;
        }

        .outSide {
            width: 500px;

        }

        .MemberNum {
            color: #7E1436;
        }

        .MemberNumInput {
            border-style: none;
            outline: none;
            background-color: transparent;
        }
        .last{
                margin-bottom: 100px;
            }
        .center{
                margin: auto;
            }
    </style>
</head>
<body>
<!--navigation-------------------------------->
    <nav>
        <!--social-link-and-phont-number-->
        <div class="social-call">
            <!--social-links-->
            <div class="social">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
            <!--phone-number-->
            <div class="phone">
                <span>Call +123456789</span>
            </div>
        </div>

        <!--menu-bar-------------------------------------->
        <div class="navigation">
            <!--logo---------->
            <a href="#" class="logo">
                <img src="${basePath}/EEIT3101/images/PetPetLogo.png" />
            </a>
            <!--menu-icon---------------------->
            <div class="toggle"></div>

            <!--menu----------->
            <ul class="menu">
                <li><a href="#">????????????</a></li>

                <li><a href="#">????????????</a>
                    <!--sale-label-->
                    <span class="sale-lable">Sale</span>
                </li>

                <li><a href="#">????????????</a></li>
                <li><a href="#">???????????????</a></li>
                <li><a href="#">????????????</a></li>
            </ul>
            <!--right-menu------->
            <div class="right-menu">
                <!--search-->
                <a href="javascript:void(0);" class="search">
                    <i class="fas fa-search"></i>
                </a>
                <!--user-->
                <a href="javascript:void(0);" class="user">
                    <i class="fas fa-user"></i>
                </a>
                <!--cart-icon-->
                <a href="#">
                    <i class="fas fa-shopping-cart">
                        <!--number-of-product-in-cart-->
                        <span class="num-cart-product">0</span>
                    </i>
                </a>
            </div>
        </div>
    </nav>
    <!--search-bar------------------------------->
    <div class="search-bar">
        <!--search-input-------->
        <div class="search-input">
            <!--input----->
            <input type="text" placeholder="Search For Product" />
            <!--cancel-btn-->
            <a href="javascript:void(0);" class="search-cancel">
                <i class="fas fa-times"></i>
            </a>
        </div>
    </div>

    <!--login-and-sign-up-form--------------------->
    <div class="form">
        <!--login-------------------->
        <div class="login-form">
            <!--cancel-btn--------->
            <a href="javascript:void(0);" class="form-cancel">
                <i class="fas fa-times"></i>
            </a>

            <!--heading---->
            <strong>????????????</strong>
            <!--inputs-->
            <form method="post" action="newCheckMemberData.controller">
                <input type="email" placeholder="Example@gmail.com" name="email" required>
                <input type="password" placeholder="Password" name="password" required>
                <!--submit-btn-->
                <input type="submit" value="Log In">
            </form>
            <!--forget-and-sign-up-btn-->
            <div class="form-btns">
                <a href="#" class="forget">???????????????</a>
                <a href="javascript:void(0);" class="sign-up-btn">????????????</a>
            </div>

        </div>


        <!--Sign-up-------------------->
        <div class="sign-up-form">
            <!--cancel-btn--------->
            <a href="javascript:void(0);" class="form-cancel">
                <i class="fas fa-times"></i>
            </a>

            <!--heading---->
            <strong>????????????</strong>
            <!--inputs-->
            <form method="post" action="newRegistermember.controller">
                <input type="email" placeholder="Example@gmail.com" name="email" required>
                <input type="password" placeholder="Password" name="password" required>
                <input type="password" placeholder="Confirm Password" name="cpassword" required>
                <!--submit-btn-->
                <input type="submit" value="Sign Up">
            </form>
            <!--forget-and-sign-up-btn-->
            <div class="form-btns">
                <a href="javascript:void(0);" class="already-acount">??????????????????</a>
            </div>

        </div>

    </div>

    <jsp:useBean id="member" scope="request" class="com.petpet.bean.LoginBean" />
        <h1>????????????</h1>
        <form method="post" action="newGetMemberLogin.controller">
        	<div>
                <h4 class="MemberNum">
                    <input class="MemberNum MemberNumInput" readonly type="Hidden" id="memberid" name="memberid" 
                    value="${member.memberid}">
                </h4>
            </div>
            <div class="input-group flex-nowrap input-group-lg div">
                <span class="input-group-text">??????</span>
                <input id="email" type="text" name="email" disabled value="${member.email}">
            </div>
            <div class="input-group flex-nowrap input-group-lg div">
                <span class="input-group-text">??????</span>
                <input id="password" type="password" name="password" disabled value="${member.password}">
            </div>              
       	    <div class="input-group input-group-lg div">
                <span class="input-group-text ">??????</span>
                <input type="text" class="form-control" placeholder="???" id="firstName" name="firstname" disabled value="${member.firstname}" autocomplete="off">
                <input type="text" class="form-control" placeholder="???" id="lastName" name="lastname" disabled value="${member.lastname}" autocomplete="off">
            </div>
            <div class="input-group flex-nowrap input-group-lg div">
                <span class="input-group-text">??????</span>
                <div class="btn-group">
                    <input type="text" id="genderInput" name="gender" disabled value="${member.gender}">
                </div>
            </div>
            <div class="input-group flex-nowrap input-group-lg div">
                <span class="input-group-text">??????</span>
                <input id="birthday" type="date" name="birthday" disabled value="${member.birthday}">
            </div>
            <div class="input-group flex-nowrap input-group-lg div">
                <span class="input-group-text">????????????</span>
                <input type="text" class="form-control" placeholder="????????????" id="mobil" name="mobile" disabled value="${member.mobile}" autocomplete="off">
            </div>
            <div class="d-grid gap-2 col-6 mx-auto container" align="center">
                <button type="submit" class="btn btn-success center" id="signOutput"
                    style="width:200px;height:40px;">??????</button>
                    <a href="newLogout.controller">
                <button type="button" class="btn btn-success" id="signOut" class="center"
                    style="width:200px;height:40px;">??????</button></a>
            </div>
        </form>
        <div class="last"></div>


<!--services--------------------------------------------->
    <section class="services">
        <!--service-box-1-------------------->
        <div class="services-box">
            <i class="fas fa-shipping-fast"></i>
            <span>?????????</span>
            <p>?????????????????????</p>
        </div>

        <!--service-box-2-------------------->
        <div class="services-box">
            <i class="fas fa-headphones-alt"></i>
            <span>24????????????</span>
            <p>????????????????????????</p>
        </div>

        <!--service-box-3-------------------->
        <div class="services-box">
            <i class="fas fa-sync"></i>
            <span>???????????? 100%??????</span>
            <p>?????????????????????????????????????????????</p>
        </div>
    </section>

<!--footer--------------------------------------->
    <footer>
        <!--copyright----------------->
        <span class="copyright">
            Copyright 2021 - EEIT31????????????????????????7???
        </span>
        <!--subscribe--->
        <div class="subscribe">
            <form>
                <input type="email" placeholder="Example@gmail.com" required/>
                <input type="submit" value="Subscribe">
            </form>
        </div>
    </footer>

    <!--script-------->
    <script type="text/javascript">

        /*----For Search bar---------------------*/
        $(document).on('click', '.search', function () {
            $('.search-bar').addClass('search-bar-active')
        });

        $(document).on('click', '.search-cancel', function () {
            $('.search-bar').removeClass('search-bar-active')
        });

        /*--login-sign-up-form-----------------*/
        $(document).on('click', '.user,.already-acount', function () {
            $('.form').addClass('login-active').removeClass('sign-up-active')
        });

        $(document).on('click', '.sign-up-btn', function () {
            $('.form').addClass('sign-up-active').removeClass('login-active')
        });

        $(document).on('click', '.form-cancel', function () {
            $('.form').removeClass('login-active').removeClass('sign-up-active')
        });

        /*---full-slider-script--------------*/
        $(document).ready(function () {
            $('#adaptive').lightSlider({
                adaptiveHeight: true,
                auto: true,
                item: 1,
                slideMargin: 0,
                loop: true
            });
        });
        /*--Feature-slider--------------------*/
        $(document).ready(function() {
        $('#autoWidth').lightSlider({
        autoWidth:true,
        loop:true,
        onSliderLoad: function() {
            $('#autoWidth').removeClass('cS-hidden');
        } 
    });  
  });

  /*----for-fix-menu-when-scroll----------------------*/
  $(window).scroll(function(){
      if($(document).scrollTop() > 50){
          $('.navigation').addClass('fix-nav');
      }
      else{
        $('.navigation').removeClass('fix-nav');
      }
  })
  /*--for-responsive-menu-----------------*/
  $(document).ready(function(){
      $('.toggle').click(function(){
          $('.toggle').toggleClass('active')
          $('.navigation').toggleClass('active')
      })
  })

    </script>
</body>
</html>