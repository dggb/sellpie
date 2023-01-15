<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<title>SellPie</title>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
* {
  font-family: "Noto Sans KR", "Noto Sans", Helvetica, Arial, "Malgun Gothic", sans-serif; }

@-webkit-keyframes root__bounceIn__3s4 {
  from, 20%, 40%, 60%, 80%, to {
    -webkit-animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
            animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1); }
  0% {
    opacity: 0;
    -webkit-transform: scale3d(0.3, 0.3, 0.3);
            transform: scale3d(0.3, 0.3, 0.3); }
  20% {
    -webkit-transform: scale3d(1.5, 1.5, 1.5);
            transform: scale3d(1.5, 1.5, 1.5); }
  40% {
    -webkit-transform: scale3d(0.9, 0.9, 0.9);
            transform: scale3d(0.9, 0.9, 0.9); }
  60% {
    opacity: 1;
    -webkit-transform: scale3d(1.03, 1.03, 1.03);
            transform: scale3d(1.03, 1.03, 1.03); }
  80% {
    -webkit-transform: scale3d(0.97, 0.97, 0.97);
            transform: scale3d(0.97, 0.97, 0.97); }
  to {
    opacity: 1;
    -webkit-transform: scale3d(1, 1, 1);
            transform: scale3d(1, 1, 1); } }
@keyframes root__bounceIn__3s4 {
  from, 20%, 40%, 60%, 80%, to {
    -webkit-animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
            animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1); }
  0% {
    opacity: 0;
    -webkit-transform: scale3d(0.3, 0.3, 0.3);
            transform: scale3d(0.3, 0.3, 0.3); }
  20% {
    -webkit-transform: scale3d(1.5, 1.5, 1.5);
            transform: scale3d(1.5, 1.5, 1.5); }
  40% {
    -webkit-transform: scale3d(0.9, 0.9, 0.9);
            transform: scale3d(0.9, 0.9, 0.9); }
  60% {
    opacity: 1;
    -webkit-transform: scale3d(1.03, 1.03, 1.03);
            transform: scale3d(1.03, 1.03, 1.03); }
  80% {
    -webkit-transform: scale3d(0.97, 0.97, 0.97);
            transform: scale3d(0.97, 0.97, 0.97); }
  to {
    opacity: 1;
    -webkit-transform: scale3d(1, 1, 1);
            transform: scale3d(1, 1, 1); } }

  html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary, time, mark, audio, video {
    margin: 0;
    padding: 0;
    border: 0;
    outline: 0;
    font-size: 100%;
    vertical-align: baseline;
    background: transparent; }
  body {
    line-height: 1; }
  article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section {
    display: block; }
  nav ul {
    list-style: none; }
  blockquote, q {
    quotes: none; }
  blockquote:before, blockquote:after, q:before, q:after {
    content: "";
    content: none; }
  a {
    margin: 0;
    padding: 0;
    font-size: 100%;
    vertical-align: baseline;
    background: transparent; }
  ins {
    background-color: #ff9;
    color: #000;
    text-decoration: none; }
  mark {
    background-color: #ff9;
    color: #000;
    font-style: italic;
    font-weight: 600; }
  del {
    text-decoration: line-through; }
  abbr[title], dfn[title] {
    border-bottom: 1px dotted;
    cursor: help; }
  table {
    border-collapse: collapse;
    border-spacing: 0; }
  hr {
    display: block;
    height: 1px;
    border: 0;
    border-top: 1px solid #cccccc;
    margin: 1em 0;
    padding: 0; }
  input, select {
    vertical-align: middle; }
  .DraftEditor-editorContainer, .DraftEditor-root, .public-DraftEditor-content {
    height: inherit;
    text-align: initial; }
  .public-DraftEditor-content[contenteditable="true"] {
    -webkit-user-modify: read-write-plaintext-only; }
  .DraftEditor-root {
    position: relative; }
  .DraftEditor-editorContainer {
    background-color: rgba(255, 255, 255, 0);
    border-left: 0.1px solid transparent;
    position: relative;
    z-index: 1; }
  .public-DraftEditor-block {
    position: relative; }
  .DraftEditor-alignLeft .public-DraftStyleDefault-block {
    text-align: left; }
  .DraftEditor-alignLeft .public-DraftEditorPlaceholder-root {
    left: 0;
    text-align: left; }
  .DraftEditor-alignCenter .public-DraftStyleDefault-block {
    text-align: center; }
  .DraftEditor-alignCenter .public-DraftEditorPlaceholder-root {
    margin: 0 auto;
    text-align: center;
    width: 100%; }
  .DraftEditor-alignRight .public-DraftStyleDefault-block {
    text-align: right; }
  .DraftEditor-alignRight .public-DraftEditorPlaceholder-root {
    right: 0;
    text-align: right; }
  .public-DraftEditorPlaceholder-root {
    color: #9197a3;
    position: absolute;
    z-index: 0; }
  .public-DraftEditorPlaceholder-hasFocus {
    color: #bdc1c9; }
  .DraftEditorPlaceholder-hidden {
    display: none; }
  .public-DraftStyleDefault-block {
    position: relative;
    white-space: pre-wrap; }
  .public-DraftStyleDefault-ltr {
    direction: ltr;
    text-align: left; }
  .public-DraftStyleDefault-rtl {
    direction: rtl;
    text-align: right; }
  .public-DraftStyleDefault-listLTR {
    direction: ltr; }
  .public-DraftStyleDefault-listRTL {
    direction: rtl; }
  .public-DraftStyleDefault-ol, .public-DraftStyleDefault-ul {
    margin: 16px 0;
    padding: 0; }
  .public-DraftStyleDefault-depth0.public-DraftStyleDefault-listLTR {
    margin-left: 1.5em; }
  .public-DraftStyleDefault-depth0.public-DraftStyleDefault-listRTL {
    margin-right: 1.5em; }
  .public-DraftStyleDefault-depth1.public-DraftStyleDefault-listLTR {
    margin-left: 3em; }
  .public-DraftStyleDefault-depth1.public-DraftStyleDefault-listRTL {
    margin-right: 3em; }
  .public-DraftStyleDefault-depth2.public-DraftStyleDefault-listLTR {
    margin-left: 4.5em; }
  .public-DraftStyleDefault-depth2.public-DraftStyleDefault-listRTL {
    margin-right: 4.5em; }
  .public-DraftStyleDefault-depth3.public-DraftStyleDefault-listLTR {
    margin-left: 6em; }
  .public-DraftStyleDefault-depth3.public-DraftStyleDefault-listRTL {
    margin-right: 6em; }
  .public-DraftStyleDefault-depth4.public-DraftStyleDefault-listLTR {
    margin-left: 7.5em; }
  .public-DraftStyleDefault-depth4.public-DraftStyleDefault-listRTL {
    margin-right: 7.5em; }
  .public-DraftStyleDefault-unorderedListItem {
    list-style-type: square;
    position: relative; }
  .public-DraftStyleDefault-unorderedListItem.public-DraftStyleDefault-depth0 {
    list-style-type: disc; }
  .public-DraftStyleDefault-unorderedListItem.public-DraftStyleDefault-depth1 {
    list-style-type: circle; }
  .public-DraftStyleDefault-orderedListItem {
    list-style-type: none;
    position: relative; }
  .public-DraftStyleDefault-orderedListItem.public-DraftStyleDefault-listLTR:before {
    left: -36px;
    position: absolute;
    text-align: right;
    width: 30px; }
  .public-DraftStyleDefault-orderedListItem.public-DraftStyleDefault-listRTL:before {
    position: absolute;
    right: -36px;
    text-align: left;
    width: 30px; }
  .public-DraftStyleDefault-orderedListItem:before {
    content: counter(ol0) ". ";
    counter-increment: ol0; }
  .public-DraftStyleDefault-orderedListItem.public-DraftStyleDefault-depth1:before {
    content: counter(ol1) ". ";
    counter-increment: ol1; }
  .public-DraftStyleDefault-orderedListItem.public-DraftStyleDefault-depth2:before {
    content: counter(ol2) ". ";
    counter-increment: ol2; }
  .public-DraftStyleDefault-orderedListItem.public-DraftStyleDefault-depth3:before {
    content: counter(ol3) ". ";
    counter-increment: ol3; }
  .public-DraftStyleDefault-orderedListItem.public-DraftStyleDefault-depth4:before {
    content: counter(ol4) ". ";
    counter-increment: ol4; }
  .public-DraftStyleDefault-depth0.public-DraftStyleDefault-reset {
    counter-reset: ol0; }
  .public-DraftStyleDefault-depth1.public-DraftStyleDefault-reset {
    counter-reset: ol1; }
  .public-DraftStyleDefault-depth2.public-DraftStyleDefault-reset {
    counter-reset: ol2; }
  .public-DraftStyleDefault-depth3.public-DraftStyleDefault-reset {
    counter-reset: ol3; }
  .public-DraftStyleDefault-depth4.public-DraftStyleDefault-reset {
    counter-reset: ol4; }


.post-show-dialog-content > div {
  border-radius: 8px !important;
  background-color: #fff !important;
  -webkit-box-shadow: 0 4px 10px 4px rgba(0, 0, 0, 0.05), 0 1px 1px 0 rgba(0, 0, 0, 0.1) !important;
          box-shadow: 0 4px 10px 4px rgba(0, 0, 0, 0.05), 0 1px 1px 0 rgba(0, 0, 0, 0.1) !important;
  border: solid 1px #dce3e6 !important; }

.post-show-dialog-body {
  overflow: hidden !important; }

img[data-role^="brochure"] {
  cursor: -webkit-zoom-in;
  cursor: zoom-in; }

html, body {
  height: 100%;
  min-height: 100%;
  color: #333;
  overflow-anchor: none; }

.wf-inactive {
  visibility: visible; }

.wf-active {
  visibility: visible; }

button {
  padding: 0;
  margin: 0;
  border: 0;
  background-color: transparent; }

* {
  -webkit-box-sizing: border-box;
          box-sizing: border-box; }

a {
  color: inherit;
  cursor: pointer;
  text-decoration: none; }

ul {
  list-style: none; }

button {
  padding: 0;
  margin: 0; }

button:focus {
  outline: 0; }

button::-moz-focus-inner {
  border: 0; }

input[type="number"]::-webkit-inner-spin-button, input[type="number"]::-webkit-outer-spin-button {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  

</style>
<style type="text/css" id="s2398-0">
@keyframes sharePopOver__bounceIn__1X_ {
  from, 20%, 40%, 60%, 80%, to {
    -webkit-animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
            animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1); }
  0% {
    opacity: 0;
    -webkit-transform: scale3d(0.3, 0.3, 0.3);
            transform: scale3d(0.3, 0.3, 0.3); }
  20% {
    -webkit-transform: scale3d(1.5, 1.5, 1.5);
            transform: scale3d(1.5, 1.5, 1.5); }
  40% {
    -webkit-transform: scale3d(0.9, 0.9, 0.9);
            transform: scale3d(0.9, 0.9, 0.9); }
  60% {
    opacity: 1;
    -webkit-transform: scale3d(1.03, 1.03, 1.03);
            transform: scale3d(1.03, 1.03, 1.03); }
  80% {
    -webkit-transform: scale3d(0.97, 0.97, 0.97);
            transform: scale3d(0.97, 0.97, 0.97); }
  to {
    opacity: 1;
    -webkit-transform: scale3d(1, 1, 1);
            transform: scale3d(1, 1, 1); } }

.sharePopOver__popover__3iu {
  width: 300px;
  border-radius: 6px;
  background-color: #fff;
  -webkit-box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.18);
          box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.18);
  border: solid 1px #f5f5f5; }

.sharePopOver__menuWrapper__1tG {
  padding: 14px; }

.sharePopOver__menu__FGh {
  position: relative;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center; }

.sharePopOver__collectionImage__2wt {
  position: absolute;
  margin-right: 6px;
  top: 0;
  right: 0; }
  .sharePopOver__collectionImage__2wt i {
    margin-top: -3px; }
  .sharePopOver__collectionImage__2wt:hover img {
    -webkit-box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.5);
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.5); }

.sharePopOver__leftIcon__1xF {
  margin-right: 6px; }
  .sharePopOver__leftIcon__1xF i {
    display: inline-block;
    vertical-align: top;
    height: 20px; }
  .sharePopOver__leftIcon__1xF svg {
    width: 20px;
    height: 20px; }

.sharePopOver__rightIcon__228 {
  width: 3px; }
  .sharePopOver__rightIcon__228 i {
    display: inline-block;
    vertical-align: top;
    height: 40px; }
  .sharePopOver__rightIcon__228 svg {
    margin-top: 2.5px; }
</style>    
<style type="text/css" id="s1666-0">

@-webkit-keyframes signUpDialog__bounceIn__1rX {
  from, 20%, 40%, 60%, 80%, to {
    -webkit-animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
            animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1); }
  0% {
    opacity: 0;
    -webkit-transform: scale3d(0.3, 0.3, 0.3);
            transform: scale3d(0.3, 0.3, 0.3); }
  20% {
    -webkit-transform: scale3d(1.5, 1.5, 1.5);
            transform: scale3d(1.5, 1.5, 1.5); }
  40% {
    -webkit-transform: scale3d(0.9, 0.9, 0.9);
            transform: scale3d(0.9, 0.9, 0.9); }
  60% {
    opacity: 1;
    -webkit-transform: scale3d(1.03, 1.03, 1.03);
            transform: scale3d(1.03, 1.03, 1.03); }
  80% {
    -webkit-transform: scale3d(0.97, 0.97, 0.97);
            transform: scale3d(0.97, 0.97, 0.97); }
  to {
    opacity: 1;
    -webkit-transform: scale3d(1, 1, 1);
            transform: scale3d(1, 1, 1); } }
@keyframes signUpDialog__bounceIn__1rX {
  from, 20%, 40%, 60%, 80%, to {
    -webkit-animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
            animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1); }
  0% {
    opacity: 0;
    -webkit-transform: scale3d(0.3, 0.3, 0.3);
            transform: scale3d(0.3, 0.3, 0.3); }
  20% {
    -webkit-transform: scale3d(1.5, 1.5, 1.5);
            transform: scale3d(1.5, 1.5, 1.5); }
  40% {
    -webkit-transform: scale3d(0.9, 0.9, 0.9);
            transform: scale3d(0.9, 0.9, 0.9); }
  60% {
    opacity: 1;
    -webkit-transform: scale3d(1.03, 1.03, 1.03);
            transform: scale3d(1.03, 1.03, 1.03); }
  80% {
    -webkit-transform: scale3d(0.97, 0.97, 0.97);
            transform: scale3d(0.97, 0.97, 0.97); }
  to {
    opacity: 1;
    -webkit-transform: scale3d(1, 1, 1);
            transform: scale3d(1, 1, 1); } }
</style>
<style type="text/css" id="s1953-0">/* New Vingle */
/* Old Vingle */
/* Component Specific colors */
/* font weights */
/* Element Sizes */
/* Z-indexs */
/* Animations */
@-webkit-keyframes imageBrochure__bounceIn__zFQ {
  from, 20%, 40%, 60%, 80%, to {
    -webkit-animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
            animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1); }
  0% {
    opacity: 0;
    -webkit-transform: scale3d(0.3, 0.3, 0.3);
            transform: scale3d(0.3, 0.3, 0.3); }
  20% {
    -webkit-transform: scale3d(1.5, 1.5, 1.5);
            transform: scale3d(1.5, 1.5, 1.5); }
  40% {
    -webkit-transform: scale3d(0.9, 0.9, 0.9);
            transform: scale3d(0.9, 0.9, 0.9); }
  60% {
    opacity: 1;
    -webkit-transform: scale3d(1.03, 1.03, 1.03);
            transform: scale3d(1.03, 1.03, 1.03); }
  80% {
    -webkit-transform: scale3d(0.97, 0.97, 0.97);
            transform: scale3d(0.97, 0.97, 0.97); }
  to {
    opacity: 1;
    -webkit-transform: scale3d(1, 1, 1);
            transform: scale3d(1, 1, 1); } }
@keyframes imageBrochure__bounceIn__zFQ {
  from, 20%, 40%, 60%, 80%, to {
    -webkit-animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
            animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1); }
  0% {
    opacity: 0;
    -webkit-transform: scale3d(0.3, 0.3, 0.3);
            transform: scale3d(0.3, 0.3, 0.3); }
  20% {
    -webkit-transform: scale3d(1.5, 1.5, 1.5);
            transform: scale3d(1.5, 1.5, 1.5); }
  40% {
    -webkit-transform: scale3d(0.9, 0.9, 0.9);
            transform: scale3d(0.9, 0.9, 0.9); }
  60% {
    opacity: 1;
    -webkit-transform: scale3d(1.03, 1.03, 1.03);
            transform: scale3d(1.03, 1.03, 1.03); }
  80% {
    -webkit-transform: scale3d(0.97, 0.97, 0.97);
            transform: scale3d(0.97, 0.97, 0.97); }
  to {
    opacity: 1;
    -webkit-transform: scale3d(1, 1, 1);
            transform: scale3d(1, 1, 1); } }

.imageBrochure__brochureWrapper__LYY {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background-color: #fafafa;
  z-index: 99999;
  visibility: hidden; }
  .imageBrochure__brochureWrapper__LYY.imageBrochure__show__2Ah {
    visibility: visible; }

.imageBrochure__header__2Lj {
  background-color: #fff;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-direction: row;
          flex-direction: row;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  height: 70px;
  padding: 0 70px;
  border-bottom: 1px solid #e9eef0; }
  .imageBrochure__header__2Lj .imageBrochure__icon__RE0 {
    width: 34px;
    height: 34px;
    cursor: pointer; }
  .imageBrochure__header__2Lj .imageBrochure__userWrapper__24O {
    -webkit-box-flex: 1;
        -ms-flex: 1;
            flex: 1 1; }
  .imageBrochure__header__2Lj .imageBrochure__positionWrapper__Znc {
    -webkit-box-flex: 1;
        -ms-flex: 1;
            flex: 1 1;
    text-align: center;
    font-size: 13px;
    color: #1f2629; }
  .imageBrochure__header__2Lj .imageBrochure__menuWrapper__1tQ {
    -webkit-box-flex: 1;
        -ms-flex: 1;
            flex: 1 1;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: end;
        -ms-flex-pack: end;
            justify-content: flex-end; }
    .imageBrochure__header__2Lj .imageBrochure__menuWrapper__1tQ .imageBrochure__closeWrapper__3al {
      margin-left: 20px; }

.imageBrochure__contentWrapper__2o- {
  position: relative;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  width: 100%;
  height: calc(100% - 70px); }
  .imageBrochure__contentWrapper__2o- .imageBrochure__background__1Ng {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    z-index: 0; }
  .imageBrochure__contentWrapper__2o- .imageBrochure__content__31K {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: center;
        -ms-flex-pack: center;
            justify-content: center;
    -webkit-box-align: center;
        -ms-flex-align: center;
            align-items: center;
    overflow: scroll;
    z-index: 1;
    -ms-overflow-style: none;
    overflow: -moz-scrollbars-none; }
    .imageBrochure__contentWrapper__2o- .imageBrochure__content__31K::-webkit-scrollbar {
      display: none; }
  .imageBrochure__contentWrapper__2o- .imageBrochure__leftArrow__16f, .imageBrochure__contentWrapper__2o- .imageBrochure__rightArrow__pe1 {
    position: absolute;
    width: 60px;
    height: 60px;
    cursor: pointer;
    z-index: 1; }
  .imageBrochure__contentWrapper__2o- .imageBrochure__leftArrow__16f {
    left: 70px; }
  .imageBrochure__contentWrapper__2o- .imageBrochure__rightArrow__pe1 {
    right: 70px; }
</style>
<style type="text/css" id="s2383-0">


.solidButton__buttonWrapper__tkE {
  display: inline-block;
  vertical-align: top;
  max-width: 350px; }

.solidButton__button__15V {
  height: 55px;
  line-height: 55px;
  border-radius: 100px;
  font-size: 14px;
  color: #fff;
  cursor: pointer;
  text-align: center; }
  .solidButton__button__15V.solidButton__disabled__15i {
    background-color: #aeb8bd;
    opacity: 0.4;
    pointer-events: none;
    cursor: not-allowed; }

.solidButton__gray__3Zy {
  background-color: #aeb8bd; }
  .solidButton__gray__3Zy:hover {
    background-color: #869197; }
  .solidButton__gray__3Zy:active {
    background-color: #59646a; }

.solidButton__blue__3Ui {
  background-color: #1cbcd7; }
  .solidButton__blue__3Ui:active {
    background-color: #008095; }

.solidButton__red__3k6 {
  background-color: #fb2942; }
  .solidButton__red__3k6:hover {
    background-color: #d52238; }
  .solidButton__red__3k6:active {
    background-color: #ad1326; }
</style>
<style type="text/css" id="s2126-0">

.navbar__navWrapper__2mJ {
  position: absolute;
  width: 100%;
  height: 84px;
  z-index: 500;
  text-transform: uppercase;
  color: #fff;
  font-size: 14px;
  line-height: 24px;
  margin-top: 40px; }
  .navbar__navWrapper__2mJ button {
    color: #fff; }
  .navbar__navWrapper__2mJ a {
    color: #fff;
    cursor: pointer; }
  .navbar__navWrapper__2mJ .navbar__container__3tL {
    position: relative;
    height: 35px;
    line-height: 33px; }
    .navbar__navWrapper__2mJ .navbar__container__3tL .navbar__left__2RB {
      display: inline-block;
      vertical-align: top;
      list-style: none;
      padding-left: 0;
      float: left; }
      .navbar__navWrapper__2mJ .navbar__container__3tL .navbar__left__2RB li {
        display: inline-block;
        margin-left: 60px;
        line-height: 36px; }
    .navbar__navWrapper__2mJ .navbar__container__3tL .navbar__right__2FE {
      display: inline-block;
      vertical-align: top;
      list-style: none;
      padding-left: 0;
      float: right; }
      .navbar__navWrapper__2mJ .navbar__container__3tL .navbar__right__2FE li {
        margin-right: 40px;
        display: inline-block;
        cursor: pointer;
        text-align: center;
        line-height: 36px; }
        .navbar__navWrapper__2mJ .navbar__container__3tL .navbar__right__2FE li.navbar__login__3ct {
          height: 40px;
          width: 80px;
          border-radius: 100px;
          border: 1px solid #fff; }
          .navbar__navWrapper__2mJ .navbar__container__3tL .navbar__right__2FE li.navbar__login__3ct:hover {
            background-color: rgba(255, 255, 255, 0.1); }
</style>

<style type="text/css" id="s2726-0">/* New Vingle */
/* Old Vingle */
/* Component Specific colors */
/* font weights */
/* Element Sizes */
/* Z-indexs */
/* Animations */

.signUpComponent__footer__DSK .signUpComponent__btnFB__1uM, .signUpComponent__footer__DSK .signUpComponent__btnEmail__25y {
  width: 350px;
  height: 55px;
  border-radius: 100px; }

.signUpComponent__bodyWrapper__3ND {
  background-repeat: no-repeat;
  height: 100%;
  position: relative;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  overflow: scroll; }
  .signUpComponent__bodyWrapper__3ND .signUpComponent__backgroundImage__3VS {
    position: absolute;
    width: 100%;
    height: 100%;}
  .signUpComponent__bodyWrapper__3ND .signUpComponent__backgroundImagesWrapper__VTf {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: -1; }
    .signUpComponent__bodyWrapper__3ND .signUpComponent__backgroundImagesWrapper__VTf::after {
      content: "";
      position: absolute;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.2);
      z-index: 1; }
  .signUpComponent__bodyWrapper__3ND .signUpComponent__container__6PN {
    position: absolute;
    top: 200px;
    left: 0;
    right: 0;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
        -ms-flex-align: center;
            align-items: center;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
        -ms-flex-direction: column;
            flex-direction: column; }
    @media (max-height: 740px) {
      .signUpComponent__bodyWrapper__3ND .signUpComponent__container__6PN {
        top: 124px; } }
      .signUpComponent__bodyWrapper__3ND .signUpComponent__container__6PN .signUpComponent__logo__3Im svg {
        width: 210px;
        height: 78px; }
    .signUpComponent__bodyWrapper__3ND .signUpComponent__container__6PN .signUpComponent__comment__1Pa {
      width: 780px;
      height: 117px;
      font-weight: 200;
      font-size: 32px;
      line-height: 1.5;
      text-align: center;
      color: #fff;
      margin-top: 20px;
      -webkit-animation: signUpComponent__fade__2ze 3s infinite;
              animation: signUpComponent__fade__2ze 3s infinite; }
      .signUpComponent__bodyWrapper__3ND .signUpComponent__container__6PN .signUpComponent__comment__1Pa .signUpComponent__title__xzN {
        font-size: 48px;
        line-height: 1.21;
        margin-bottom: 14px; }
      .signUpComponent__bodyWrapper__3ND .signUpComponent__container__6PN .signUpComponent__comment__1Pa .signUpComponent__subTitle__135 {
        font-size: 26px;
        line-height: 1.38; }
      .signUpComponent__bodyWrapper__3ND .signUpComponent__container__6PN .signUpComponent__comment__1Pa .signUpComponent__small__bDV {
        font-size: 29px;
        line-height: 1.34; }
      .signUpComponent__bodyWrapper__3ND .signUpComponent__container__6PN .signUpComponent__comment__1Pa b {
        font-weight: 400; }

.signUpComponent__footer__DSK {
  position: absolute;
  bottom: 130px;
  left: 0;
  right: 0;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
      -ms-flex-direction: column;
          flex-direction: column; }
  @media (max-height: 740px) {
    .signUpComponent__footer__DSK {
      top: 400px; } }
  .signUpComponent__footer__DSK .signUpComponent__btnFB__1uM {
    background-color: #3b559d;
    margin-bottom: 12px; }
    .signUpComponent__footer__DSK .signUpComponent__btnFB__1uM:hover {
      background-color: #314a90; }
  .signUpComponent__footer__DSK .signUpComponent__btnEmail__25y {
    border: solid 1px #fff;
    background-color: #fff;
    color: #394247; }
  .signUpComponent__footer__DSK .signUpComponent__hadAccount__gtQ {
    width: 350px;
    font-size: 14px;
    font-weight: 400;
    text-align: center;
    color: #fff;
    margin-top: 40px; }
    .signUpComponent__footer__DSK .signUpComponent__hadAccount__gtQ .signUpComponent__login__3Iz {
      text-decoration: underline; }

@-webkit-keyframes signUpComponent__fade__2ze {
  0% {
    opacity: 0; }
  25% {
    opacity: 1; }
  50% {
    opacity: 1; }
  75% {
    opacity: 1; }
  100% {
    opacity: 0; } }

@keyframes signUpComponent__fade__2ze {
  0% {
    opacity: 0; }
  25% {
    opacity: 1; }
  50% {
    opacity: 1; }
  75% {
    opacity: 1; }
  100% {
    opacity: 0; } }
</style>
<script>
  $(function(){
	  var count = 0;
     var $view2 = $(".signUpComponent__backgroundImagesWrapper__VTf").children();
     setInterval(function(){
        if(count==7){
           $view2.eq(0).animate({opacity:"1"}, 2000);
        }
        if(count==8){
           count=0;
        }
        $view2.eq(count).animate({opacity:"0"}, 2000);
        count++
        $view2.eq(count).animate({opacity:"1"}, 2000);
        console.log(count);
     },4000);
     
     $("._5f5mN").click(function(){
    	location.href="/sellpie/signIn.do"; 
     });
      $(".signUpComponent__btnFB__1uM").click(function(){
    		
    	  <c:if test="${not empty sessionScope.user }">
    	  	location.href="/sellpie/selectBoardList.do"; 
    	  </c:if>
      	<c:if test="${empty sessionScope.user }">
      	 	location.href="/sellpie/memberJoin.do"; 
      	</c:if>
    	 
      });  
      
     });
</script>
</head>
      <body>
        <div id="vingle-web">
            <div>
                <div class="root__rootWrapper__1So">
                    <div class="commonView__container__2RU">
                        <div class="commonView__container__2RU">
                            <nav class="navbar__navWrapper__2mJ">
                                <div class="navbar__container__3tL clearfix">
                                	<ul class="navbar__left__2RB">
                                		<li><a href="/sellpie/admin/inspectAu.do"><span>관리자 페이지</span></a></li>
                                	</ul>
                                </div>
                            </nav>
                        <div class="signUpComponent__bodyWrapper__3ND">
                            <div class="signUpComponent__backgroundImagesWrapper__VTf">
                                <div class="signUpComponent__backgroundImage__3VS" style="opacity: 1; background-image: url('resources/images/mainImg/main1.jpg'); background-size: cover;"></div>
                                <div class="signUpComponent__backgroundImage__3VS" style="opacity: 0; background-image: url('resources/images/mainImg/main2.jpg'); background-size: cover;"></div>
                                <div class="signUpComponent__backgroundImage__3VS" style="opacity: 0; background-image: url('resources/images/mainImg/main3.jpg'); background-size: cover;"></div>
                                <div class="signUpComponent__backgroundImage__3VS" style="opacity: 0; background-image: url('resources/images/mainImg/main4.jpg'); background-size: cover;"></div>
                                <div class="signUpComponent__backgroundImage__3VS" style="opacity: 0; background-image: url('resources/images/mainImg/main5.jpg'); background-size: cover;"></div>
                                <div class="signUpComponent__backgroundImage__3VS" style="opacity: 0; background-image: url('resources/images/mainImg/main6.jpg'); background-size: cover;"></div>
                                <div class="signUpComponent__backgroundImage__3VS" style="opacity: 0; background-image: url('resources/images/mainImg/main7.jpg'); background-size: cover;"></div>
                                <div class="signUpComponent__backgroundImage__3VS" style="opacity: 0; background-image: url('resources/images/mainImg/main8.jpg');; background-size: cover;"></div>
                            </div>
                            <div class="signUpComponent__container__6PN">
                                <div class="signUpComponent__logo__3Im">
                                    <img src="resources/images/join/logo_sellpie.png "/>
                                </div>
                                    <div class="signUpComponent__comment__1Pa">내 친구가 좋아하는 것이 아닌<br><b>"내"</b>가 좋아하는 것을 즐기세요
                                    </div>
                            </div>
                            <div class="signUpComponent__footer__DSK">
                            <c:if test="${not empty sessionScope.user }">
                           		<div class="solidButton__buttonWrapper__tkE">
                                    <button type="submit" class="solidButton__button__15V   signUpComponent__btnFB__1uM"><c:out value="${sessionScope.user.name }"/> 님 반가워요!</button>
                                </div>
                            </c:if>
                            	<c:if test="${empty sessionScope.user }">
                                <div class="solidButton__buttonWrapper__tkE">
                                    <button type="submit" class="solidButton__button__15V   signUpComponent__btnFB__1uM">이메일로 시작하기</button>
                                </div>
                            	</c:if>
                            <div class="signUpComponent__hadAccount__gtQ"><span>이미 SellPie를 사용하고 있나요? </span>
                                <span class="signUpComponent__login__3Iz">
                                	<c:if test="${not empty sessionScope.user }">
                                	<a href="/sellpie/selectBoardList.do">
                                		<span>SellPie 시작하기</span>
                                	</a>
                                	</c:if>
                                	<c:if test="${empty sessionScope.user }">
                                	<a href="/sellpie/login.do">
                                		<span>로그인</span>
                                	</a>
                                	</c:if>
                                </span>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </body>
</html>