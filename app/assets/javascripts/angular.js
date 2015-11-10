var SantaFunke = angular.module('SantaFunke', []);
//ng-route - publishes to the address bar

var childIdForCreatePresent;

/* START Session Controller
Lets have a session controller so that we can change the styling based on who is logged in
We can, later, use current_user.type to define which css we link! */
SantaFunke.controller('SessionController', ['$http', function($http){
  var controller = this;
  $http.get('/session').then(function(data){
    // the get /session should return a data object that contains a current_user property
    controller.current_user = data.data.current_user;
    childIdForCreatePresent = data.data.current_user.id;
    console.log("the current user is: ", controller.current_user);
  }, function(error){
    console.log("you have an error: ", error);
    //what should we do with the errors?
  });
}]);
/* End SessionController */





/* START User Controller
We need to create a flexible controller for Elves and Children
They're both users, so they share certain data points, but they have different functionality? */
SantaFunke.controller('ChildrenController', ['$http', function($http){
  var controller = this;
  $http.get('/users').then(function(data){
    // the get /users should return a data object containing all of the children
  }, function(error){
    //what should we do with the errors?
  });

}]);

/* END User Controller */






/* START Toy Controller
  create a new toy??
*/
SantaFunke.controller('ToyController', ['$http', function($http){
  var controller = this;
  var authenticity_token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  this.get_all_toys = function(){
    //hits toys#index which should return all the toys
    $http.get('/toys').then(function(data){
      // the get /toy should return a data object containing all the toys
      // console.log("These are all the toys");
      // console.log(data);
      // console.log("End all toys");
      controller.all_toys = data.data.toys;
      console.log("all toys: ", data.data.toys);
    }, function(error){
      //what should we do with the errors?
    });
  };
  /* Call the function on instantiation */
  // console.log("calling get_all_toys: ");
  this.get_all_toys();

   //hits presents#index which should return the toys that belong to the current user THROUGH presents
  this.get_presents = function(){
    $http.get('/presents').then(function(data){
      controller.my_toys = data.data.presents;
      // data.data.presents[index].child / toy / elf
    }, function(error){
      //do what
    });
  };
  /* Call the function on instantiation */
  this.get_presents();

  this.createToy = function(){
    // temporarily add to the list until the AJAX query completes
    // do we even want to do this? Kind of flashes before the data saves to the db and the name of the toy is permanently added to the dropdown list..
    console.log("testing in the createToy function!");
    controller.all_toys.push({
      name: controller.newToyName + "...loading",
      value: controller.newToyValue + "...loading",
      description: controller.newToyDescription + "...loading"
    });

    //make a post to /toys
    $http.post('/toys', {
      //include authenticity_token
      authenticity_token: authenticity_token,
      //values from form
      toy: {
        name: controller.newToyName,
        value: controller.newToyValue,
        description: controller.newToyDescription
      }
    }).then(function(data){
      console.log("the new toy: ", data);
      controller.all_toys.pop();
      controller.all_toys.push(data.data); //what does this look like?
      // controller.get_presents(); //wtFrig?
    },function(error){
      // do what
    });
  };

// working as of 945pm on Monday 11/9
  this.createPresent = function(){
    //make a post to /presents
    $http.post('/presents', {
      //include authenticity_token
      authenticity_token: authenticity_token,
      //values from form
      present: {
        // must add display values
        //How to get the right child id? By grabbing it from within the SessionController, and storing it as a global variable within this js file
        child_id: childIdForCreatePresent,
        // elf_id: this.newToyValue, non-extant in child version, elf id is only ever set in update
        toy_id: controller.toyID //whatever we want, ties to form
      }
    }).then(function(data){
      // console.log("present is: ", present);
      controller.get_presents();
    },function(error){
      // do what
    });
  };


}]);

/* End Toy Controller */







/* START Judgement Controller
*/

/* End Judgement Controller */








/* MAYBE */

/* START Presents Controller

*/
// SantaFunke.controller('PresentsController', ['$http', function($http){
//   var controller = this;
//   /* the authenticity token variable is probably incorrect seeing as we will have multiple on the same page */
//   var authenticity_token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
//   $http.get('/presents').then(function(data){
//
//   }, function(error){
//     //what should we do with the errors
//   });
// }]);

/* END Presents Controller */


// countdown
var end = new Date('12/25/2015');

var _second = 1000;
var _minute = _second * 60;
var _hour = _minute * 60;
var _day = _hour * 24;
var timer;

  function showRemaining() {
      var now = new Date();
      var distance = end - now;
      if (distance < 0) {

          clearInterval(timer);
          document.getElementById('countdown').innerHTML = 'EXPIRED!';

          return;
      }
      var days = Math.floor(distance / _day);
      var hours = Math.floor((distance % _day) / _hour);
      var minutes = Math.floor((distance % _hour) / _minute);
      var seconds = Math.floor((distance % _minute) / _second);

  document.getElementById('countdown').innerHTML = days + 'days ';
      document.getElementById('countdown').innerHTML += hours + 'hrs ';
      document.getElementById('countdown').innerHTML += minutes + 'mins ';
      document.getElementById('countdown').innerHTML += seconds + 'secs';
  }

  timer = setInterval(showRemaining, 1000);
