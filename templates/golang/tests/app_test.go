package tests

import (
	"net/http"
	"net/http/httptest"
	"testing"

	"example.com/__PROJECT_SLUG__/internal/app"
)

func TestHealthz(t *testing.T) {
	router := app.NewRouter(app.Config{Name: "__PROJECT_NAME__"})
	req := httptest.NewRequest(http.MethodGet, "/healthz", nil)
	rec := httptest.NewRecorder()

	router.ServeHTTP(rec, req)

	if rec.Code != http.StatusOK {
		t.Fatalf("expected status 200, got %d", rec.Code)
	}
}
