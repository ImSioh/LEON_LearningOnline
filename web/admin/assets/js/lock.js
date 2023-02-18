function lockAcc(msg) {
    if (confirm(msg)) {
        return true;
    } else {
        return false;
    }
}