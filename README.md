AJP.Stats
=========

Description of the issue
------------------------
When using Liferay on Tomcat + Apache/nginx you might experience a small Denial Of Service from time to time.
In the most cases the issue is in Tomcat's configuration, well to be more precis - in lack of the configuration ;)

When defining an AJP connector on port 8009:

```<Connector port="8009" protocol="AJP/1.3" redirectPort="8443" address="10.0.1.2" URIEncoding="UTF-8">```

People often miss one important setting - ```connectiontimeout``` and ```keepAlivetimeout```.

Solution
------------------------
```connectiontimeout``` - is tehe number of milliseconds Connector will wait, after acceptins a connection, for the request URI to be presented. If no value is defined, then the value becomes:  -1 (i.e. infinite).

```KeepAliveTimeout``` - is the numbe rof milliseconds Connector will wait for another AJP request before closing the connection. The default value is to use the value that has been set for the connectiontimeout attribute.

Lack of this configuration might cause the DOS (Denial Of Service) of the application itself.
Once you have fixed this problem be defining the settings mentioned above you might want to monitor number of connections to your application/Liferay and see if there is a high number of connections maintaned or not.

AJP.Stats
------------------------

Thats why I have created small, not really intelligent, but working script to make your life easier :)

ENJOY!
