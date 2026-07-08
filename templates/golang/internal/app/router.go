package app

import (
	"net/http"

	"github.com/go-chi/chi/v5"
)

func NewRouter(cfg Config) http.Handler {
	r := chi.NewRouter()

	r.Get("/healthz", func(w http.ResponseWriter, _ *http.Request) {
		w.Header().Set("Content-Type", "text/plain")
		_, _ = w.Write([]byte(cfg.Name + " ok"))
	})

	return r
}
