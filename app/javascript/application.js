// Entry point for the build script in your package.json
//= require rails-ujs
//= require turbolinks
//= require_tree .
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
Turbo.session.drive = false;
document.addEventListener("turbolinks:load", function() {
    Rails.start();
});