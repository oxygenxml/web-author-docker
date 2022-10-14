package com.oxygenxml.backend_id;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ro.sync.exml.plugin.PluginExtension;

public class CookieSetter implements Filter, PluginExtension {

  @Override
  public void init(FilterConfig filterConfig) throws ServletException {
    // Nothing to do
  }
  @Override
  public void destroy() {
    // Nothing to do
  }

  @Override
  public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
      throws ServletException, IOException {
    HttpServletResponse response = (HttpServletResponse) resp;
    String backendId = System.getenv("BACKEND_ID");
    Cookie cookie = new Cookie("backend", backendId);
    cookie.setMaxAge(-1);
    cookie.setPath("/");
    response.addCookie(cookie);
    chain.doFilter(req, resp);
  }
}
