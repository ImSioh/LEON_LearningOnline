function lockAcc(msg) {
//    reason = 'Write the reason...';
//    if (prompt(msg, reason)) {
//        document.getElementById("reason").appendChild(reason);
    if (confirm(msg)) {
        return true;
    } else {
        return false;
    }
//    document.getElementById("lock-acc").submit();
}