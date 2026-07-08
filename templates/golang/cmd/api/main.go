package main

import (
	"log"
	"net/http"

	"example.com/__PROJECT_SLUG__/internal/app"
)

func main() {
	cfg := app.LoadConfig()
	handler := app.NewRouter(cfg)

	addr := cfg.Host + ":" + cfg.Port
	log.Printf("%s listening on http://%s", cfg.Name, addr)
	if err := http.ListenAndServe(addr, handler); err != nil {
		log.Fatal(err)
	}
}
