'use strict';

import "ace-css/css/ace.css";import "font-awesome/css/font-awesome.css";

import "./index.html";
import { Main } from "./Main.elm";
var mountNode = document.getElementById('main');

// .embed() can take an optional second argument. This would be an object describing the data we need to start a program, i.e. a userID or some token
var app = Main.embed(mountNode);
