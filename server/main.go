package  main

import (
    "fmt"
"log"
"net/http"

)

func homePage (w http.ResponseWriter, r * http.Request){
 enableCors(&w)
 fmt.Fprintf( w, "Updated !!" );

}

func enableCors(w *http.ResponseWriter) {
        (*w).Header().Set("Access-Control-Allow-Origin", "*")
        (*w).Header().Set("Access-Control-Allow-Methods", "GET")
        (*w).Header().Set("Cache-Control", "no-store, no-cache, must-revalidate, post-check=0, pre-check=0")
        (*w).Header().Set("Content-Type", "application/json; charset=UTF-8")
        (*w).Header().Set("Vary", "Accept-Encoding")
}
func handleRequests(){
  http.HandleFunc("/", homePage)
  log.Fatal(http.ListenAndServe(":8080", nil))

}


func main(){

        handleRequests()
}
