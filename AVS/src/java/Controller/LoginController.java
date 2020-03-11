/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.AuthenticateManagement;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author BinhNT
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        HttpSession session = request.getSession();
//            session.removeAttribute("username");
      RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/jsp/login.jsp");
                dispatcher.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
//            session.removeAttribute("username");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || username.trim().equals("")) {
            request.setAttribute("errorMessage", "Please input username");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/jsp/login.jsp");
            dispatcher.forward(request, response);
            return;
        } else {
            AuthenticateManagement authenticateManagement = new AuthenticateManagement();
            AuthenticateManagement.CheckUsernameResult result = authenticateManagement.checkUserAccount(username, password);
            if (username != null && password == null) {
                request.setAttribute("errorMessage", "Please input password");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/jsp/login.jsp");
                dispatcher.forward(request, response);
            } else if (result == AuthenticateManagement.CheckUsernameResult.WRONG_PASSWORD) {
                session.setAttribute("username", username);
                request.setAttribute("errorMessage", "Password is incorrect");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/jsp/login.jsp");
                dispatcher.forward(request, response);

            } else if (result == AuthenticateManagement.CheckUsernameResult.NO_USERNAME) {
                request.setAttribute("errorMessage", "Username is incorrect");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/jsp/login.jsp");
                dispatcher.forward(request, response);
            } else if (result == AuthenticateManagement.CheckUsernameResult.SHORT) {
                request.setAttribute("errorMessage", "Password need at least 6 character");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/jsp/login.jsp");
                dispatcher.forward(request, response);
            } else {
                session.setAttribute("username", username);
                response.sendRedirect("/AVS/HomeController");
            }
        }

//        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
