function lockAcc(msg) {
    reason = 'Write the reason...';
    if (prompt(msg, reason)) {
        return true;
    } else {
        return false;
    }
}