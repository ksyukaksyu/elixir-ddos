package main
import (
  "net/http"
  "log"
)
func main() {

  for {
    resp, err := http.Get("http://127.0.0.1:4433/me/who_am_i")
    
    if err != nil {
      log.Fatalln(err)
    }

    defer resp.Body.Close()
  }  
}
