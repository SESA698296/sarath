trigger MagicByte on ContentVersion (after insert) {   
       MagicBytes.testMe(trigger.new);

}