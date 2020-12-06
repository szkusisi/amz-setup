    # In order to prevent HTTP header spoofing set this to empty strings,
    # and then reset them to their correct value.
    RequestHeader set SSL_CLIENT_S_DN ""
    RequestHeader set SSL_CLIENT_I_DN ""
    RequestHeader set SSL_CLIENT_S_DN_O ""
    RequestHeader set SSL_CLIENT_S_DN_OU ""
    RequestHeader set SSL_CLIENT_S_DN_CN ""
    RequestHeader set SSL_CLIENT_S_DN_C ""
    RequestHeader set SSL_CLIENT_S_DN_ST ""
    RequestHeader set SSL_CLIENT_S_DN_L ""
    RequestHeader set SSL_CLIENT_S_DN_Email ""
    RequestHeader set SSL_CLIENT_I_DN_O ""
    RequestHeader set SSL_CLIENT_I_DN_OU ""
    RequestHeader set SSL_CLIENT_I_DN_CN ""
    RequestHeader set SSL_CLIENT_I_DN_C ""
    RequestHeader set SSL_CLIENT_I_DN_ST ""
    RequestHeader set SSL_CLIENT_I_DN_L ""
    RequestHeader set SSL_CLIENT_I_DN_Email ""
    RequestHeader set SSL_SERVER_S_DN_OU ""
    RequestHeader set SSL_CLIENT_VERIFY ""

    <Location />
        RequestHeader set SSL_CLIENT_S_DN "%{SSL_CLIENT_S_DN}s"
        RequestHeader set SSL_CLIENT_I_DN "%{SSL_CLIENT_I_DN}s"
        RequestHeader set SSL_CLIENT_S_DN_O "%{SSL_CLIENT_S_DN_O}s"
        RequestHeader set SSL_CLIENT_S_DN_OU "%{SSL_CLIENT_S_DN_OU}s"
        RequestHeader set SSL_CLIENT_S_DN_CN "%{SSL_CLIENT_S_DN_CN}s"
        RequestHeader set SSL_CLIENT_S_DN_C "%{SSL_CLIENT_S_DN_C}s"
        RequestHeader set SSL_CLIENT_S_DN_ST "%{SSL_CLIENT_S_DN_ST}s"
        RequestHeader set SSL_CLIENT_S_DN_L "%{SSL_CLIENT_S_DN_L}s"
        RequestHeader set SSL_CLIENT_S_DN_Email "%{SSL_CLIENT_S_DN_Email}s"
        RequestHeader set SSL_CLIENT_I_DN_O "%{SSL_CLIENT_I_DN_O}s"
        RequestHeader set SSL_CLIENT_I_DN_OU "%{SSL_CLIENT_I_DN_OU}s"
        RequestHeader set SSL_CLIENT_I_DN_CN "%{SSL_CLIENT_I_DN_CN}s"
        RequestHeader set SSL_CLIENT_I_DN_C "%{SSL_CLIENT_I_DN_C}s"
        RequestHeader set SSL_CLIENT_I_DN_ST "%{SSL_CLIENT_I_DN_ST}s"
        RequestHeader set SSL_CLIENT_I_DN_L "%{SSL_CLIENT_I_DN_L}s"
        RequestHeader set SSL_CLIENT_I_DN_Email "%{SSL_CLIENT_I_DN_Email}s"
        RequestHeader set SSL_SERVER_S_DN_OU "%{SSL_SERVER_S_DN_OU}s"
        RequestHeader set SSL_CLIENT_VERIFY "%{SSL_CLIENT_VERIFY}s"
    </Location>



