package app

import "os"

type Config struct {
	Name string
	Host string
	Port string
}

func LoadConfig() Config {
	return Config{
		Name: envOrDefault("APP_NAME", "__PROJECT_NAME__"),
		Host: envOrDefault("APP_HOST", "0.0.0.0"),
		Port: envOrDefault("APP_PORT", "8080"),
	}
}

func envOrDefault(key, fallback string) string {
	if value := os.Getenv(key); value != "" {
		return value
	}
	return fallback
}
