package com.xkorey.gyh.admin.dto;

import com.google.common.base.Objects;
import lombok.Data;

@Data
public class SearchDto {

    private Long VisitId;
    private String type;
    private String value;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SearchDto searchDto = (SearchDto) o;
        return Objects.equal(VisitId, searchDto.VisitId) &&
                Objects.equal(type, searchDto.type) &&
                Objects.equal(value, searchDto.value);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(VisitId, type, value);
    }
}
