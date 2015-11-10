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
    // Mon 2:17 this works
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


  // NOT HERE YET
  this.createToy = function(){
    // temporarily add to the list until the AJAX query completes
    controller.my_toys.push({
      name: this.newToyName + "...loading",
      value: this.newToyValue + "...loading",
      description: this.newToyDescription + "...loading"
    });

    //make a post to /toys
    $http.post('/toys', {
      //include authenticity_token
      authenticity_token: authenticity_token,
      //values from form
      toy: {
        name: this.newToyName,
        value: this.newToyValue,
        description: this.newToyDescription
      }
    }).then(function(data){
      controller.my_toys.pop();
      controller.my_toys.push(data.toy); //what does this look like?
      controller.get_presents(); //wtFrig?
    },function(error){
      // do what
    });
  };

  //WORKING ON THIS
  this.createPresent = function(){
    //make a post to /presents
    $http.post('/presents', {
      //include authenticity_token
      authenticity_token: authenticity_token,
      //values from form
      present: {
        // must add display values
        //How to get the right child id?
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
