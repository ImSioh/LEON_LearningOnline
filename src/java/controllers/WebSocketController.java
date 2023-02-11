package controllers;

import dao.AccountDAO;
import dao.ClassObjectDAO;
import dto.Account;
import dto.ClassObject;
import helpers.WebSocketConfigurator;
import jakarta.websocket.OnClose;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

@ServerEndpoint(value = "/wsendpoint", configurator = WebSocketConfigurator.class)
public class WebSocketController {
    
    private static HashMap<UUID, ArrayList<Session>> activeUsers = new HashMap<>();
    
    public static void sendToClass(UUID classId, String message) {
        try {
            ArrayList<Account> accounts = new AccountDAO().getAccountsInClass(classId);
            for (Account account : accounts) {
                ArrayList<Session> sessions = activeUsers.get(account.getAccountId());
                if (sessions == null) continue;
                for (Session session : sessions) {
                    session.getAsyncRemote().sendText(message);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @OnOpen
    public void onOpen(Session session) {
        Account account = (Account) session.getUserProperties().get("account");
        UUID accountId = account.getAccountId();
        ArrayList<Session> sessions = activeUsers.get(accountId);
        if (sessions == null) {
            sessions = new ArrayList<>();
            activeUsers.put(accountId, sessions);
        }
        sessions.add(session);
//        System.out.println(accountId + " joined, session: " + session.getId() + " | Current: " + activeUsers.size());
    }

    @OnMessage
    public void onMessage(String message, Session userSession) throws IOException {
    }
    
    @OnClose
    public void onClose(Session session) {
        Account account = (Account) session.getUserProperties().get("account");
        UUID accountId = account.getAccountId();
        ArrayList<Session> sessions = activeUsers.get(accountId);
        sessions.remove(session);
        if (sessions.size() == 0) {
            activeUsers.remove(accountId);
        }
//        System.out.println(accountId + " left, session: " + session.getId() + " | Current: " + activeUsers.size());
    }
    
}
