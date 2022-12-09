trigger StopEMail on EmailMessage (before insert) {
    if(trigger.Isbefore && trigger.Isinsert){
        StopEmailHandler.stopMethod(trigger.new);
    }

}