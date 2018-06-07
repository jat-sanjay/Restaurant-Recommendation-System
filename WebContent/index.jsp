<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="google-signin-client_id" content="887428532616-jl4svqjq01ofjvm252br9ue8g7cnle6f.apps.googleusercontent.com">
<title>Home Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<% int c=16;
session.setAttribute("count",c); %>
<script>
function onSignIn(googleUser) {
  var profile = googleUser.getBasicProfile();
change();
 var id=profile.getId();
 var name=profile.getName();
 var img=profile.getImageUrl();
 var email=profile.getEmail();
 document.getElementById("name").value = name;
 document.getElementById("img").value = img;
 document.getElementById("email").value = email;
 document.getElementById("name2").value = name;
 document.getElementById("img2").value = img;
 document.getElementById("email2").value = email;
 //window.location="http://localhost:8080/Minor2.0/home.jsp?name="+name+"&img="+img+"&email="+email;
  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
  console.log('Name: ' + profile.getName());
  console.log('Image URL: ' + profile.getImageUrl());
  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
}
</script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      testAPI();
    } else if (response.status === 'not_authorized') {
      // The person is logged into Facebook, but not your app.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    } else {
      // The person is not logged into Facebook, so we're not sure if
      // they are logged into this app or not.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into Facebook.';
    }
  }

  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '1698381776845133',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.8' // use graph api version 2.8
  });

  // Now that we've initialized the JavaScript SDK, we call 
  // FB.getLoginStatus().  This function gets the state of the
  // person visiting this page and can return one of three states to
  // the callback you provide.  They can be:
  //
  // 1. Logged into your app ('connected')
  // 2. Logged into Facebook, but not your app ('not_authorized')
  // 3. Not logged into Facebook and can't tell if they are logged into
  //    your app or not.
  //
  // These three cases are handled in the callback function.

  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';
    });
  }
</script>
<script>

function change() // no ';' here
{
    var elem = document.getElementById("logbutton");
    if (elem.value=="Log In") elem.value = "Log Out";
    else elem.value = "Log In";
}
function logout()
{
   var elem = document.getElementById("logbutton");
   if (elem.value=="Log Out")
  {
     var auth2 = gapi.auth2.getAuthInstance();
      auth2.signOut().then(function () {
        console.log('User signed out.');
      });
      elem.value = "Log In";
      document.getElementById("name").value = "";
      document.getElementById("img").value = "";
      document.getElementById("email").value = "";
      document.getElementById("name2").value = "";
      document.getElementById("img2").value = "";
      document.getElementById("email2").value = "";
  }  
}

</script>

</head>

<body  class="container-fluid" style="background-image: url(https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,q_80/29LN0615-29_380_Resized_2_C2_jvs9nf);min-height: 660px;background-size:cover;background-repeat: no-repeat">
<div>
<div class="row container-fluid">
<div class="col-lg-8"></div>
<div class="col-lg-4" style="margin-top: 1.3%">
<div class="col-lg-7">
</div>
<div class="col-lg-1">
<input type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" value="Log In" id="logbutton" onclick="logout()">
</div>

<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">LOG IN</h4>
      </div>
      <div class="modal-body">
        <div class="form-group has-feedback">
    <label class="control-label">Username</label>
    <input type="text" class="form-control" placeholder="Username" />
    <i class="glyphicon glyphicon-user form-control-feedback"></i>
</div>
      <div class="form-group has-feedback">
    <label class="control-label">Password</label>
    <input type="text" class="form-control" placeholder="Password" />
    <i class="glyphicon glyphicon-lock form-control-feedback"></i>
</div>
      </div>
      <div class="modal-footer">
        <div class="row" align="center">
        <div class="col-lg-4">
        <fb:login-button type="button" onClick="checkLoginState();" class="btn btn-default w3-card-4" style="background-color: #3B5998;color: #fff"> <span><img src="https://b.zmtcdn.com/images/facebook_icon.png"></span></fb:login-button>
        
        </div>

        <div class="col-lg-4 g-signin2" data-onsuccess="onSignIn" data-dismiss="modal">
         <button type="button" onClick="checkLoginState();" class="btn btn-default w3-card-4"  style="background-color: #3B5998;color: #fff"> <span><img src="https://b.zmtcdn.com/images/new_google_icon.png"></span></button>
        </div>
        <div class="col-lg-4">
       <div class="col-lg-3">  
</div>
        </div>
        </div>

      </div>
    </div>

  </div>
</div>

</div>
</div>

<div id="signupmyModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">SIGN UP</h4>
      </div>
      <div class="modal-body">
        <div class="form-group has-feedback">
    <label class="control-label">Username</label>
    <input type="text" class="form-control" placeholder="Username" />
    <i class="glyphicon glyphicon-user form-control-feedback"></i>
</div>
      <div class="form-group has-feedback">
    <label class="control-label">Password</label>
    <input type="text" class="form-control" placeholder="Password" />
    <i class="glyphicon glyphicon-lock form-control-feedback"></i>
</div>
     <div class="form-group has-feedback">
    <label class="control-label">Email Id</label>
    <input type="text" class="form-control" placeholder="Email Id" />
    <i class="glyphicon glyphicon-envelope form-control-feedback"></i>
</div>
     <div class="form-group has-feedback">
    <label class="control-label">Phone Number</label>
    <input type="text" class="form-control" placeholder="Mobile Number" />
    <i class="glyphicon glyphicon-earphone form-control-feedback"></i>
</div>
      </div>
      <div class="modal-footer">
        <div class="row" align="center">
          <div class="col-lg-6">
            <button class="btn btn-danger w3-card-4">Sign In</button>
          </div>
          <div class="col-lg-6">
            <button class="btn btn-success w3-card-4" data-toggle="modal" data-target="#myModal" data-dismiss="modal">Log in</button> 
          </div>
        </div>
    </div>
    </div>
  </div>
  </div>
<div align="center"  style="margin-top:12%;color: #fff;text-shadow:1px 1px 4px rgba(0,0,0,1);"><h1>Search restaurants near you</h1></div>
<div class="row" align="center">
<div class="col-lg-3"></div>
<div class="form-group col-lg-6">
<form class="col-lg-12" name="form2" action="home.jsp" method="POST">
<div class="input-group" id="locationField">
<input type="text" class="form-control  ui segment" style="width: 100%;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 13px;
    background-color: white;
  background-image: url(https://www.w3schools.com/howto/searchicon.png);
    background-position: 10px 10px; 
    background-repeat: no-repeat;
    padding: 21px 20px 21px 40px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;"  placeholder="Enter your Locality" name="manul"  onFocus="geolocate()" id="autocomplete" >
    <input type="text" id="name2" style="display: none;" name="name2" value="">
  <input type="text" id="email2" style="display: none;" name="email2"  value="">
  <input type="text" id="img2" style="display: none;" name="img2" value="">
   
    <script>
      // This example displays an address form, using the autocomplete feature
      // of the Google Places API to help users fill in the information.

      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

      var placeSearch, autocomplete;
      var componentForm = {
        street_number: 'short_name',
        route: 'long_name',
        locality: 'long_name',
        administrative_area_level_1: 'short_name',
        country: 'long_name',
        postal_code: 'short_name'
      };

      function initAutocomplete() {
        // Create the autocomplete object, restricting the search to geographical
        // location types.
        autocomplete = new google.maps.places.Autocomplete(
            /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
            {types: ['geocode']});

        // When the user selects an address from the dropdown, populate the address
        // fields in the form.
        autocomplete.addListener('place_changed', fillInAddress);
      }

      function fillInAddress() {
        // Get the place details from the autocomplete object.
        var place = autocomplete.getPlace();

        for (var component in componentForm) {
          document.getElementById(component).value = '';
          document.getElementById(component).disabled = false;
        }

        // Get each component of the address from the place details
        // and fill the corresponding field on the form.
        for (var i = 0; i < place.address_components.length; i++) {
          var addressType = place.address_components[i].types[0];
          if (componentForm[addressType]) {
            var val = place.address_components[i][componentForm[addressType]];
            document.getElementById(addressType).value = val;
          }
        }
      }

      // Bias the autocomplete object to the user's geographical location,
      // as supplied by the browser's 'navigator.geolocation' object.
      function geolocate() {
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var geolocation = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
            var circle = new google.maps.Circle({
              center: geolocation,
              radius: position.coords.accuracy
            });
            autocomplete.setBounds(circle.getBounds());
          });
        }
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBT9lM1OhkQF0CP1zVMmCLsO7bqfyKe-BA&libraries=places&callback=initAutocomplete"
        async defer></script>
    
 <span class="input-group-btn">
    <button class="btn btn-default  ui segment w3-green" id="locmanul" type="submit" style="padding: 12.0px 20px;">Search</button>
  </span>
  </div>
</form>
<br>
<div class="row">
 <div class="col-lg-12" style="margin-top: 4%"> 
<button  class="btn btn-default  ui segment" onClick="getLocation()" style="padding: 9px;"><img src="https://image.flaticon.com/icons/svg/67/67347.svg" width="21">Locate Me</button>
</div>
</div>

</div>
<div class="col-lg-3">
</div>
</div>

<div id="demo"></div>
 <div id="con"></div>
 <form name="myform" action="home.jsp" method="POST">  
  <input type="text" id="location" style="display: none;" name="loc" value="" >
  <input type="text" id="name" style="display: none;" name="name" value="">
  <input type="text" id="email" style="display: none;" name="email"  value="">
  <input type="text" id="img" style="display: none;" name="img" value="">
  <input type="submit" style="display: none;" value="" />
  </form>
</div>
<script>
var x = document.getElementById("con");
   var str;
   var ss;

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}

function showPosition(position) {
    var lat=position.coords.latitude;
  var lon=position.coords.longitude;
  str='https://maps.googleapis.com/maps/api/geocode/json?latlng='+lat+','+lon+'&key=AIzaSyBsRUqGzLhg4lyYdoImbTNZSx35qSybdcY'
  //x.innerHTML = "Latitude: " + position.coords.latitude + 
    //"<br>Longitude: " + position.coords.longitude + str;
  setTimeout(function myFunction() {
function loadJSON(callback) {   
    var xobj = new XMLHttpRequest();
        xobj.overrideMimeType("application/json");
    xobj.open('GET', str, true); // Replace 'my_data' with the path to your file
    xobj.onreadystatechange = function () {
          if (xobj.readyState == 4 && xobj.status == "200") {
            // Required use of an anonymous callback as .open will NOT return a value but simply returns undefined in asynchronous mode
            callback(xobj.responseText);
          }
    };
    xobj.send(null);  
 }
 
 loadJSON(function(response) {
  // Parse JSON string into object
    var actual_JSON = JSON.parse(response);
    ss = actual_JSON.results[0].formatted_address;
   
    document.getElementById("location").value = ss;
    
 });
}, 1000); 
  //window.location="http://localhost:8080/Minor2.0/home.jsp?loc="+ss+"&name="+name+"&img="+img+"&email="+email;
  setTimeout("document.myform.submit();",2000);
  
  
}

</script>


</body>
</html>