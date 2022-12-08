public with sharing class StopEmailHandler {
    public static void stopMethod(list<emailMessage> emailMessageList){
        Id profileId=userinfo.getProfileId();
        id userId=UserInfo.getUserId();
        system.debug('userId:'+userId);
        String profileName=[Select Id,Name from Profile where Id=:profileId].Name;
        system.debug('profileName:'+profileName);
        List<AuthSession> currentSession = new List<AuthSession>(); 
        
        currentSession = [SELECT LoginType , IsCurrent,SessionType, CreatedDate ,SessionSecurityLevel FROM AuthSession where 
                          IsCurrent = True and LoginHistory.UserId =: UserInfo.getUserId()];//0057b000003D21jAAC
        system.debug('currentSession:'+currentSession);
        
        boolean isApiConnected = False;
        boolean isContent = False ;
        boolean isUIConnected = False ;
        boolean isVisualForce = False ;
        if(currentSession!=null && currentSession.size()>0){
            for (AuthSession a :currentSession){
                system.debug('IsCurrent:'+a.IsCurrent);
                isApiConnected |= a.SessionType =='API';
                isContent |= a.SessionType =='Content';
                isUIConnected |= a.SessionType =='UI' ;
                isVisualForce |= a.SessionType =='Visualforce';
            }
            list<Profile_Name__mdt> profileNameList=[select id,label from Profile_Name__mdt];
            list<String> authorizeProfile = new List<String>();
            FOR(Profile_Name__mdt Pd:profileNameList){
                authorizeProfile.add(Pd.label);
            }
            system.debug('AuthorizeProfile:'+authorizeProfile);
            for (EmailMessage e : emailMessageList){
                if (authorizeProfile.contains(profileName)){
                }else{
                    e.addError( profileName + '  ' + system.label.profileName);
                }
            }
        }
        
    }
}