// Entry point for the build script in your package.json
//= require_tree .
//= require rails-ujs
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
Turbo.session.drive = true;