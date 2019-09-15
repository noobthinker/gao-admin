package com.xkorey.gyh.admin.common;

import cn.hutool.core.codec.Base64;
import com.xkorey.gyh.admin.model.RkUser;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;

import javax.crypto.SecretKey;
import java.util.Calendar;

public interface JwtToken {


    default SecretKey getSecretKey(){
        return Keys.hmacShaKeyFor(Base64.decode(getSecret()));
    }

    default String getSecret(){
        return "admin-Tx/ipHVc6qDBck8yv0oUyIAzDQmg7ahwOBYlg7OG2yqm59UFMI+xVJBu68sPxJoBvhe5D/5tX+P3\n" +
                "cgE1uvR909m1LjBXME6Vo+Qh5zsyulgULF50mop8m4UXVc85RVJZ88Xh89ne2zpusPilxkHbE5iL\n" +
                "+5vDzlsF+VeLUSTWvDOKJxQbNuWu4+Pn7RT78btNK17lFfpKQbGYlI7jm3OY8yvTAoqoEo51iH+7\n" +
                "R0L+8K4peqZdFxb812Gn3UzgQ3DcgiZ4VtJegtDoUgOlCc5mIzjQywOaB0g95Snntp62JWSx0EX4\n" +
                "WDG0Ig1Xxsv4xa4rif8xSI7b7G9p+3T5+TXyDA==";
    }


    default String getToekn(RkUser user){
       return Jwts
                .builder()
               .setHeaderParam("typ", "JWT")    //设置header
               .setHeaderParam("alg", "HS256")
               .setIssuedAt(Calendar.getInstance().getTime())     //设置iat
                .claim("id",user.getId())
                .setHeaderParam("name",user.getRealName())
                .signWith(getSecretKey())
                .compact();

    }

    default RkUser parseToken(String token){
        Jws<Claims> user = Jwts.parser().setSigningKey(getSecretKey()).parseClaimsJws(token);
        RkUser rkUser = new RkUser();
        rkUser.setRealName(StringUtils.join(user.getHeader().get("name")));
        rkUser.setId(NumberUtils.toInt(StringUtils.join(user.getBody().get("id"))));
        return rkUser;
    }

}
