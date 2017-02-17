/**
 * xhr.js
 * XMLHttpRequest 객체를 생성하는 함수
*/
function createRequest() {
 var request = null;
 try {
   // MS IE 이외의 브라우저에 적용되는 방식
   request = new XMLHttpRequest();
 } 
 catch (trymicrosoft) {
   try {
  // MS IE의 새로운 버전에 적용되는 방식
     request = new ActiveXObject("Msxml2.XMLHTTP");
   } 
   catch (othermicrosoft) {
     try {
       // MS IE의 구버전에 적용되는 방식
       request = new ActiveXObject("Microsoft.XMLHTTP");
     } 
     catch (failed) {
       request = null;
     }      // end of catch
   }     // end of catch
 }      // end of catch
 return request;
}

