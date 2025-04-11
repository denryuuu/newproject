// Entry point for the build script in your package.json

import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
Turbo.session.drive = true;
import Cropper from 'cropperjs';
import "./cropper" 
window.Cropper = Cropper;
import "./profile_cropper";