package controllers.admin;

import dao.*;
import dto.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ViewListAdminController", urlPatterns = {"/admin/feedback-list", "/admin/student-account-list", "/admin/teacher-account-list"})
public class ViewListAdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //init param
            int role = 0;
            int element;
            int page = 0;
            int numberOfPage = 0;
            String criteriaSearch = null;
            String keyword;
            String criteriaSort = null;
            boolean orderBy;
            int[] elementOption = {3, 5, 7, 10, 15};

            //get param
            //element
            try {
                element = Integer.parseInt(request.getParameter("element"));
            } catch (Exception e) {
                element = 10;
            }

            //page
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (Exception e) {
                page = 1;
            }

            //search
            criteriaSearch = request.getParameter("search");
            criteriaSearch = criteriaSearch == null ? "email" : criteriaSearch;

            //search by keyword 
            keyword = request.getParameter("keyword");

            //sort
            criteriaSort = request.getParameter("criteria");
            criteriaSort = criteriaSort == null ? "create_time" : criteriaSort;

            //sort order by
            try {
                orderBy = Boolean.valueOf(request.getParameter("orderBy"));
            } catch (Exception e) {
                orderBy = true;
            }
            String sort = orderBy ? "" : "desc";

            //set attribute
            request.setAttribute("elementOption", elementOption);
            request.setAttribute("search", criteriaSearch);
            request.setAttribute("criteria", criteriaSort);
            request.setAttribute("orderBy", orderBy);

            //connect db
            AccountDAO accountDAO = new AccountDAO();
            FeedbackDAO feedbackDAO = new FeedbackDAO();

            //feedback
            if (request.getServletPath().contains("feedback-list")) {
                try {
                    ArrayList<Account> accounts = accountDAO.getListAllAccounts();
                    ArrayList<Feedback> feedbacks = new ArrayList<>();

                    int size = feedbackDAO.getAllFeedbacks().size();
                    if (size < element) {
                        element = size;
                        page = 0;
                    }

                    if (keyword == null) {
                        feedbacks = feedbackDAO.getAllFeedbacksAndPaging(element, page);
                        numberOfPage = (int) Math.ceil(feedbackDAO.getAllFeedbacks().size() / (float) element);
                    } else {
                        keyword = keyword.trim();
                        feedbacks = feedbackDAO.getAllFeedbacksSearchAndPaging(criteriaSearch, keyword, element, page);
                        numberOfPage = (int) Math.ceil(feedbackDAO.getAllFeedbacksSearch(criteriaSearch, keyword).size() / (float) element);
                    }

                    request.setAttribute("element", element);
                    request.setAttribute("page", page);
                    request.setAttribute("numberOfPage", numberOfPage);
                    request.setAttribute("keyword", keyword);
                    request.setAttribute("feedbacks", feedbacks);
                    request.setAttribute("accounts", accounts);
                } catch (Exception ex) {
                    Logger.getLogger(ViewListAdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
            } //student
            else if (request.getServletPath().contains("student-account-list")) {
                try {
                    role = 2;
                    ArrayList<Account> accounts = new ArrayList<>();

                    int size = accountDAO.getListAllAccounts().size();
                    if (size < element) {
                        element = size;
                        page = 0;
                    }

                    if (keyword == null) {
                        accounts = accountDAO.getListAccountByRoleAndPaging(role, element, page);
                        numberOfPage = (int) Math.ceil(accountDAO.getListAccountByRole(role).size() / (float) element);
                    } else {
                        keyword = keyword.trim();
                        accounts = accountDAO.getListAccountByRoleSearchAndPaging(role, criteriaSearch, keyword, element, page);
                        numberOfPage = (int) Math.ceil(accountDAO.getListAccountByRoleSearch(role, criteriaSearch, keyword).size() / (float) element);
                    }

                    request.setAttribute("element", element);
                    request.setAttribute("page", page);
                    request.setAttribute("numberOfPage", numberOfPage);
                    request.setAttribute("keyword", keyword);
                    request.setAttribute("accountList", accounts);
                } catch (Exception ex) {
                    Logger.getLogger(ViewListAdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/admin/manageS.jsp").forward(request, response);
            } //teacher
            else if (request.getServletPath().contains("teacher-account-list")) {
                try {
                    role = 1;
                    ArrayList<Account> accounts = new ArrayList<>();

                    int size = accountDAO.getListAllAccounts().size();
                    if (size < element) {
                        element = size;
                        page = 0;
                    }

                    if (keyword == null) {
                        accounts = accountDAO.getListAccountByRoleAndPaging(role, element, page);
                        numberOfPage = (int) Math.ceil(accountDAO.getListAccountByRole(role).size() / (float) element);
                    } else {
                        keyword = keyword.trim();
                        accounts = accountDAO.getListAccountByRoleSearchAndPaging(role, criteriaSearch, keyword, element, page);
                        numberOfPage = (int) Math.ceil(accountDAO.getListAccountByRoleSearch(role, criteriaSearch, keyword).size() / (float) element);
                    }

                    request.setAttribute("element", element);
                    request.setAttribute("page", page);
                    request.setAttribute("numberOfPage", numberOfPage);
                    request.setAttribute("keyword", keyword);
                    request.setAttribute("accountList", accounts);
                } catch (Exception ex) {
                    Logger.getLogger(ViewListAdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/admin/manageT.jsp").forward(request, response);
            }
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //init param
            //init param
            int role = 0;
            int element;
            int page = 0;
            int numberOfPage = 0;
            String criteriaSearch = null;
            String keyword;
            String criteriaSort = null;
            boolean orderBy;
            int[] elementOption = {3, 5, 7, 10, 15};

            //get param
            //element
            try {
                element = Integer.parseInt(request.getParameter("element"));
            } catch (Exception e) {
                element = 10;
            }

            //page
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (Exception e) {
                page = 1;
            }

            //search
            criteriaSearch = request.getParameter("search");
            criteriaSearch = criteriaSearch == null ? "email" : criteriaSearch;

            //search by keyword 
            keyword = request.getParameter("keyword");

            //sort
            criteriaSort = request.getParameter("criteria");
            criteriaSort = criteriaSort == null ? "create_time" : criteriaSort;

            //sort order by
            try {
                orderBy = Boolean.valueOf(request.getParameter("orderBy"));
            } catch (Exception e) {
                orderBy = true;
            }
            String sort = orderBy ? "" : "desc";

            //set attribute
            request.setAttribute("elementOption", elementOption);
            request.setAttribute("search", criteriaSearch);
            request.setAttribute("criteria", criteriaSort);
            request.setAttribute("orderBy", orderBy);

            //connect db
            AccountDAO accountDAO = new AccountDAO();
            FeedbackDAO feedbackDAO = new FeedbackDAO();

            //feedback
            if (request.getServletPath().contains("feedback-list")) {
                try {
                    ArrayList<Account> accounts = accountDAO.getListAllAccounts();
                    ArrayList<Feedback> feedbacks = new ArrayList<>();

                    int size = feedbackDAO.getAllFeedbacks().size();
                    if (size < element) {
                        element = size;
                        page = 0;
                    }

                    if (keyword == null) {
                        feedbacks = feedbackDAO.getAllFeedbacksSortAndPaging(criteriaSort, sort, element, page);
                        numberOfPage = (int) Math.ceil(feedbackDAO.getAllFeedbacks().size() / (float) element);
                    } else {
                        keyword = keyword.trim();
                        feedbacks = feedbackDAO.getAllFeedbacksSearchSortAndPaging(criteriaSearch, keyword, criteriaSort, sort, element, page);
                        numberOfPage = (int) Math.ceil(feedbackDAO.getAllFeedbacksSearch(criteriaSearch, keyword).size() / (float) element);
                    }

                    request.setAttribute("element", element);
                    request.setAttribute("page", page);
                    request.setAttribute("numberOfPage", numberOfPage);
                    request.setAttribute("keyword", keyword);
                    request.setAttribute("feedbacks", feedbacks);
                    request.setAttribute("accounts", accounts);
                } catch (Exception ex) {
                    Logger.getLogger(ViewListAdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
            } //student
            else if (request.getServletPath().contains("student-account-list")) {
                try {
                    role = 2;
                    ArrayList<Account> accounts = new ArrayList<>();

                    int size = accountDAO.getListAllAccounts().size();
                    if (size < element) {
                        element = size;
                        page = 0;
                    }

                    if (keyword == null) {
                        accounts = accountDAO.getListAccountByRoleSortAndPaging(role, criteriaSort, sort, element, page);
                        numberOfPage = (int) Math.ceil(accountDAO.getListAccountByRole(role).size() / (float) element);
                    } else {
                        keyword = keyword.trim();
                        accounts = accountDAO.getListAccountByRoleSearchSortAndPaging(role, criteriaSearch, keyword, criteriaSort, sort, element, page);
                        numberOfPage = (int) Math.ceil(accountDAO.getListAccountByRoleSearch(role, criteriaSearch, keyword).size() / (float) element);
                    }

                    request.setAttribute("element", element);
                    request.setAttribute("page", page);
                    request.setAttribute("numberOfPage", numberOfPage);
                    request.setAttribute("keyword", keyword);
                    request.setAttribute("accountList", accounts);
                } catch (Exception ex) {
                    Logger.getLogger(ViewListAdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/admin/manageS.jsp").forward(request, response);
            } //teacher
            else if (request.getServletPath().contains("teacher-account-list")) {
                try {
                    role = 1;
                    ArrayList<Account> accounts = new ArrayList<>();

                    int size = accountDAO.getListAllAccounts().size();
                    if (size < element) {
                        element = size;
                        page = 0;
                    }

                    if (keyword == null) {
                        accounts = accountDAO.getListAccountByRoleSortAndPaging(role, criteriaSort, sort, element, page);
                        numberOfPage = (int) Math.ceil(accountDAO.getListAccountByRole(role).size() / (float) element);
                    } else {
                        keyword = keyword.trim();
                        accounts = accountDAO.getListAccountByRoleSearchSortAndPaging(role, criteriaSearch, keyword, criteriaSort, sort, element, page);
                        numberOfPage = (int) Math.ceil(accountDAO.getListAccountByRoleSearch(role, criteriaSearch, keyword).size() / (float) element);
                    }

                    request.setAttribute("element", element);
                    request.setAttribute("page", page);
                    request.setAttribute("numberOfPage", numberOfPage);
                    request.setAttribute("keyword", keyword);
                    request.setAttribute("accountList", accounts);
                } catch (Exception ex) {
                    Logger.getLogger(ViewListAdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/admin/manageT.jsp").forward(request, response);
            }
        } catch (Exception e) {
        }
    }
}
