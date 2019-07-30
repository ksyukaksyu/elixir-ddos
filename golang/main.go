package main
import (
  "net/http"
  "io/ioutil"
  "log"
  "fmt"
)
func main() {

  //for {
    resp, err := http.Get("http://127.0.0.1:4433/")
    if err != nil {
      log.Fatalln(err)
      fmt.Println("break 1")
      //break
    }
    defer resp.Body.Close()

    body, err := ioutil.ReadAll(resp.Body)
    if err != nil {
      log.Fatalln(err)
      fmt.Println("break 2")
      //break
    }
  //}
  log.Println(string(body))

}
