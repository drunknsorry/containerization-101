package main

import (
	"fmt"
	"net/http"
)

func home(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	fmt.Fprintln(w, "Hello World!")
}

func main() {
	//Start a new mux instance
	mux := http.NewServeMux()
	mux.HandleFunc("/", home)

	fmt.Println("Starting server on http://localhost:4000")

	serverError := http.ListenAndServe(":4000", mux)
	if serverError != nil {
		fmt.Println("Error starting server!")
	}

}
