#-f -javaagent:/data/package/tingyun/tingyun-agent-java.jar
play run -XX:+UseConcMarkSweepGC -XX:+UseCMSCompactAtFullCollection -Xmx1024m -Xms128m -Xmn600M -XX:MaxPermSize=256M -Xss256K -Dprecompiled=true -Dwritepid=true  &
