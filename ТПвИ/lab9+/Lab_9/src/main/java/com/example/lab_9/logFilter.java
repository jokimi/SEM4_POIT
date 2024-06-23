package com.example.lab_9;


import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.log4j.xml.DOMConfigurator;
import java.io.IOException;
import java.time.LocalTime;

public class logFilter implements Filter {
    private FilterConfig filterConfigObj = null;

    @Override
    public void init(FilterConfig config) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException
    {
        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;

        String servletPath = httpRequest.getServletPath();
        String method = httpRequest.getMethod();
        String timeStamp = LocalTime.now().toString();
        String remoteAddress = servletRequest.getRemoteAddr();

        filterChain.doFilter(servletRequest, servletResponse);
        System.out.println("Logging Filter Servlet called");
        System.out.println("=====================================================================");
        System.out.println("User Logged! User IP: " + remoteAddress +
                servletPath + method + timeStamp);
    }
}
