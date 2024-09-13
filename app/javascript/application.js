// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery3
//= require jquery_ujs
//= require popper
//= require bootstrap

import "@hotwired/turbo-rails"
import "controllers"
import jquery from "jquery";
window.$ = jquery;

$(function() {
    console.log("This is Sauna App!");
})