// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery3
//= require popper
//= require bootstrap
import "@hotwired/turbo-rails"
import "controllers"

import CreateReviewController from "./controllers/create_review_controller.js"
Stimulus.register("create-review", CreateReviewController)

document.addEventListener("DOMContentLoaded", function() {
  const reviewForm = document.getElementById("review-form");

  reviewForm.addEventListener("submit", function(event) {
    event.preventDefault();

    const formData = new FormData(reviewForm);
    formData.append("product_id", productId); // Use productId variable

    fetch("/products/" + productId + "/reviews", {
      method: "POST",
      body: formData
    })
    .then(response => {
      if (response.ok) {
        console.log("Review submitted successfully");
        // Optionally, you can reset the form after successful submission
        reviewForm.reset();
      } else {
        throw new Error("Failed to submit review");
      }
    })
    .catch(error => {
      console.error(error);
    });
  });
});
