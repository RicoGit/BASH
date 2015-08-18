#!/bin/sh
exec scala "$0" "$@"
!#

import scala.io._
import java.io._

val source0 = args(0)
val source1 = args(1)

val tempOutput = new PrintWriter(new File("high_temp"))
val output = new PrintWriter(new File("output"))

val highlights = Source.fromFile(source0).getLines()
  .filter(_.contains("""highlight":"1""""))
  .map(line ⇒ {
  val pattern = """url":"([^\"]+)",""".r.unanchored
  val url = pattern.findFirstMatchIn(line).get.group(1)
  println(url)
  tempOutput.println(url)
  url
}).toList

Source.fromFile(source1).getLines()
  .foreach(line ⇒ {
  val matchedUrl = highlights.find(url ⇒ { line.contains(url) })
  if (matchedUrl.isDefined) {
    //        val first = line.replaceFirst("\"time spend sec.\":\"[^\"]+\"", "\"highlight\":\"1\"")
    val first = line.replaceFirst("\"}", ",\"highlight\":\"1\"}")
    print(".")
    output.println(first)
  } else {
    output.println(line.replaceFirst(",\"time spend sec.\":\"[^\"]+\"", ""))
  }
})

tempOutput.close()


