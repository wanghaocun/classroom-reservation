package com.mango.pojo;


import lombok.*;

import java.util.Date;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SystemMessage {

    private String id;
    private String s_id;
    private String s_name;
    private String content;
    private String reply;
    private Date time;

}
