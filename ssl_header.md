https://www.infra-ware.net/support/apache-clauth/

        RequestHeader set SSL_CLIENT_S_DN "%{SSL_CLIENT_S_DN}s"
        RequestHeader set SSL_CLIENT_S_DN_C "%{SSL_CLIENT_S_DN_C}s"
        RequestHeader set SSL_CLIENT_S_DN_ST "%{SSL_CLIENT_S_DN_ST}s"
        RequestHeader set SSL_CLIENT_S_DN_L "%{SSL_CLIENT_S_DN_L}s"
        RequestHeader set SSL_CLIENT_S_DN_CN "%{SSL_CLIENT_S_DN_CN}s"
        RequestHeader set SSL_CLIENT_S_DN_O "%{SSL_CLIENT_S_DN_O}s"
        RequestHeader set SSL_CLIENT_S_DN_OU "%{SSL_CLIENT_S_DN_OU}s"
        RequestHeader set SSL_CLIENT_S_DN_Email "%{SSL_CLIENT_S_DN_Email}s"

        RequestHeader set SSL_CLIENT_I_DN "%{SSL_CLIENT_I_DN}s"
        RequestHeader set SSL_CLIENT_I_DN_C "%{SSL_CLIENT_I_DN_C}s"
        RequestHeader set SSL_CLIENT_I_DN_ST "%{SSL_CLIENT_I_DN_ST}s"
        RequestHeader set SSL_CLIENT_I_DN_L "%{SSL_CLIENT_I_DN_L}s"
        RequestHeader set SSL_CLIENT_I_DN_CN "%{SSL_CLIENT_I_DN_CN}s"
        RequestHeader set SSL_CLIENT_I_DN_O "%{SSL_CLIENT_I_DN_O}s"
        RequestHeader set SSL_CLIENT_I_DN_OU "%{SSL_CLIENT_I_DN_OU}s"
        RequestHeader set SSL_CLIENT_I_DN_Email "%{SSL_CLIENT_I_DN_Email}s"

        RequestHeader set SSL_CLIENT_V_START "%{SSL_CLIENT_V_START}s"
        RequestHeader set SSL_CLIENT_V_END "%{SSL_CLIENT_V_END}s"

        RequestHeader set SSL_SERVER_S_DN_OU "%{SSL_SERVER_S_DN_OU}s"
        RequestHeader set SSL_CLIENT_VERIFY "%{SSL_CLIENT_VERIFY}s"

        RequestHeader set X-Client-Cert-Subject %{SSL_CLIENT_S_DN}s
        RequestHeader set X-Client-Cert-Serial  %{SSL_CLIENT_M_SERIAL}s
        RequestHeader set X-Client-Cert         %{SSL_CLIENT_CERT}s



SSL_CLIENT_S_DN: CN=client2.aiocr.de <br />
SSL_CLIENT_S_DN_C: (null) <br />
SSL_CLIENT_S_DN_ST: (null) <br />
SSL_CLIENT_S_DN_L: (null) <br />
SSL_CLIENT_S_DN_CN: client2.aiocr.de <br />
SSL_CLIENT_S_DN_O: (null) <br />
SSL_CLIENT_S_DN_OU: (null) <br />
SSL_CLIENT_S_DN_Email: (null) <br />
SSL_CLIENT_I_DN: CN=aiocr.de <br />
SSL_CLIENT_I_DN_C: (null) <br />
SSL_CLIENT_I_DN_ST: (null) <br />
SSL_CLIENT_I_DN_L: (null) <br />
SSL_CLIENT_I_DN_CN: aiocr.de <br />
SSL_CLIENT_I_DN_O: (null) <br />
SSL_CLIENT_I_DN_OU: (null) <br />
SSL_CLIENT_I_DN_Email: (null) <br />
SSL_CLIENT_V_START: Dec  6 04:19:23 2020 GMT <br />
SSL_CLIENT_V_END: Mar 11 04:19:23 2023 GMT <br />
SSL_SERVER_S_DN_OU: (null) <br />
SSL_CLIENT_VERIFY: SUCCESS <br />
X-Client-Cert-Subject: CN=client2.aiocr.de <br />
X-Client-Cert-Serial: C20A4469C58E350CBE141D97DC2C5395 <br />
X-Client-Cert: -----BEGIN CERTIFICATE----- MIIDTjCCAjagAwIBAgIRAMIKRGnFjjUMvhQdl9wsU5UwDQYJKoZIhvcNAQELBQAw EzERMA8GA1UEAwwIYWlvY3IuZGUwHhcNMjAxMjA2MDQxOTIzWhcNMjMwMzExMDQx OTIzWjAbMRkwFwYDVQQDDBBjbGllbnQyLmFpb2NyLmRlMIIBIjANBgkqhkiG9w0B AQEFAAOCAQ8AMIIBCgKCAQEAvCfouY+tQVEtwDDzRxUTGo361QZQmF0ljRvFSTZM RsXBuSNV24W1ckyAOIPzWuGZ1rSbVfxTYROgVlDhDTQFU8DTMTrx/Z8D3GHgTyn2 Scf7KFh+z/yNpsI2PwGiAkgC3STzWU4nACL6mW/JJpjFzhKEwwTybIhUOL5fX/2m /u1pqBf0mg1NOAVx3SLOD73TckcL1hZJkUHLNsfLc42lo6mDnoWO5VXtCxAocvTg 4rc2v0WVKDIoD1wRD+WwQ7beMwEhPG/Sw73YzaJEho8J1nr47AI72PmDXvG+5jw+ s/+PfKIY6xjclezL6HWjEl2j7Epj12IEcp0Ir2XlKxnQMQIDAQABo4GUMIGRMAkG A1UdEwQCMAAwHQYDVR0OBBYEFCs/7kroQCjKjXGC03wmIPYqKquzMEMGA1UdIwQ8 MDqAFGurxMvtSKlgvD1YAUpv4Z05owbDoRekFTATMREwDwYDVQQDDAhhaW9jci5k ZYIJAL0vFK7BKBDGMBMGA1UdJQQMMAoGCCsGAQUFBwMCMAsGA1UdDwQEAwIHgDAN BgkqhkiG9w0BAQsFAAOCAQEAbTpYw0+XbjV7g/20SfXjgO+6DrKHrcK4HyyTDzcY hTOer3m5tTQo8nVJbpLI4naQz9TprsVnpwoH3EgUumSUdHQMsR4yLI1CrJIVe3lK oaA1Bi/vduWqgcUYafA8XHoQRIn2apjzfjTFF4FQz2iD3KM4RKEY0gMFF1tYM6uB lnbfUB8WLoYyt7Ns/wKUVKuYdsZSTFxVEFARm1ncSAgXWAmmoGsYE9CanRijtCB7 6ahLZYjhKcQxdctbA+gsOoE1ZbPs/maKhRk6KMzQd+FkBVN0q+AhqS+9p4YDMCIw 989kOtnbqRbb8G991tYShwzbAPN4d9QiV+6JwJjphuE0ig== -----END CERTIFICATE----- <br />

