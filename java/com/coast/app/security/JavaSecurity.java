package com.coast.app.security;

import java.util.Base64;

public class JavaSecurity 
{
	public String decrypt(String encodedString) {
    	byte[] decodedBytes = Base64.getDecoder().decode(encodedString);
    	String decodedString = new String(decodedBytes);
        return decodedString;
    }
    
    public String encrypt(String decodeString) {
    	String encodedString = Base64.getEncoder().encodeToString(decodeString.getBytes());
    	return encodedString;

    }

}
