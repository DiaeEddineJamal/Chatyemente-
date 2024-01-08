package application;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.shape.Rectangle;

import java.io.ByteArrayInputStream;

public class GroupProfileController {
    @FXML
    private Label groupNameLabel;
    @FXML
    private Label adminLabel;
    @FXML
    private ListView<String> participantsListView;
    @FXML
    private ImageView groupPhotoImageView;
    private MainController mainController;
    @FXML
    public void initialize(){
        //round the image
        Rectangle rect=new Rectangle(groupPhotoImageView.getFitWidth(),groupPhotoImageView.getFitHeight());
        rect.setArcHeight(150);
        rect.setArcWidth(150);
        groupPhotoImageView.setClip(rect);
    }
    public void setInfo(String groupName, String admin, ObservableList<String> participants, byte[] buff){
        groupNameLabel.setText(groupName);
        adminLabel.setText(admin);
        participantsListView.setItems(participants);
        if(buff!=null)
            groupPhotoImageView.setImage(new Image(new ByteArrayInputStream(buff)));
    }
}
