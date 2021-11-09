package com.ezcook.services.impls;

import com.ezcook.services.IFoodService;

public class FoodService implements IFoodService {
    @Override
    public String getTextBetweenTags(String tag, String searchText) {
        String startTag = "<" + tag + ">";
        String endTag = "</" + tag + ">";
        String result="";
        int index1 = -1;
        int index2 = -1;
        int index=0;
        while (result.length()<100)
        {
            index1=searchText.indexOf(startTag,index);
            index2=searchText.indexOf(endTag,index);
            if (index1 == -1 || index2 == -1) {
                return null;
            }
            else
            {
                index1 = index1 + startTag.length();
                result = result+searchText.substring(index1, index2);
                index=index2+endTag.length();
            }
        }

        return result.replace("<strong>"," ").replace("<strong >","").replace("</strong>"," ").replace("<br/>"," ").replace("<br>"," ").replace("<em>"," ").replace("</em>"," ");
    }
}
