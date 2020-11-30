package com.wsgs.bookstore.data;

public class Classification {
    private int classificationID;
    String classificationName;

    public Classification() {
    }

    public int getClassificationID() {
        return classificationID;
    }

    public void setClassificationID(int classificationID) {
        this.classificationID = classificationID;
    }

    public String getClassificationName() {
        return classificationName;
    }

    public void setClassificationName(String classificationName) {
        this.classificationName = classificationName;
    }

    @Override
    public String toString() {
        return "Classification{" +
                "classification=" + classificationID +
                ", classificationName='" + classificationName + '\'' +
                '}';
    }
}
