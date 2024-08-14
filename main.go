package main

import (
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
)

func main() {
	g := gin.Default()

	g.GET("/", func(c *gin.Context) {
		c.String(http.StatusOK, `Hello World~`)
	})

	err := g.Run(":8080")

	if err != nil {
		log.Fatal("Error starting server")
	}
}
