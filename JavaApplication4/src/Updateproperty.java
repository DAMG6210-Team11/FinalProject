

import java.awt.CardLayout;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.table.DefaultTableModel;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */

/**
 *
 * @author apple
 */
public class Updateproperty extends javax.swing.JPanel {

    /**
     * Creates new form Updateproperty
     */
    JPanel one;
    String username;
    int userid;
    public Updateproperty(JPanel one, String username,int userid) {
        initComponents();
         this.one = one;
        this.username = username;
        this.userid=userid;
        loadProperties();
        jTextField2.setEditable(false);
    }
    
   private void loadProperties() {
    DefaultTableModel model = (DefaultTableModel) tblperson.getModel();
    model.setRowCount(0); // Clear existing content
    try (Connection conn = JDBC.getConnection()) { // Replace JDBC.getConnection() with your actual connection method
        // Include status check in your SQL query
        String sql = "SELECT property_id, property_address, property_cost FROM PROPERTY WHERE owner_id = ? AND status <> 0";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, userid);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            Vector row = new Vector();
            row.add(rs.getInt("property_id"));
            row.add(rs.getString("property_address"));
            row.add(rs.getDouble("property_cost"));
            model.addRow(row);
        }
    } catch (Exception e) {
        JOptionPane.showMessageDialog(null, "Error loading properties: " + e.getMessage());
    }
}

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        tblperson = new javax.swing.JTable();
        btnView = new javax.swing.JButton();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jTextField15 = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        jTextField16 = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        jTextField17 = new javax.swing.JTextField();
        jLabel9 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTextArea1 = new javax.swing.JTextArea();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jTextField2 = new javax.swing.JTextField();
        jTextField13 = new javax.swing.JTextField();
        jTextField4 = new javax.swing.JTextField();
        jTextField14 = new javax.swing.JTextField();
        jTextField6 = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        btnViewLease = new javax.swing.JButton();

        tblperson.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null},
                {null, null, null},
                {null, null, null},
                {null, null, null}
            },
            new String [] {
                "Property ID", "Property Address", "Property Cost"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane1.setViewportView(tblperson);

        btnView.setText("View");
        btnView.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnViewActionPerformed(evt);
            }
        });

        jLabel4.setText("City");

        jLabel5.setText("State");

        jLabel6.setText("Zip Code");

        jLabel7.setText("Property Cost");

        jLabel8.setText("Property Type");

        jLabel9.setText("Square feet");

        jLabel10.setText("Description about the property");

        jTextArea1.setColumns(20);
        jTextArea1.setRows(5);
        jScrollPane2.setViewportView(jTextArea1);

        jLabel2.setText("Property ID");

        jLabel3.setText("Property Address");

        jLabel1.setFont(new java.awt.Font("sansserif", 0, 24)); // NOI18N
        jLabel1.setText("Update your Properties");

        jButton1.setText("update");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jButton2.setText(">>>Back");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        btnViewLease.setText("View Lease Details");
        btnViewLease.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnViewLeaseActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(133, 133, 133)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addGap(202, 202, 202))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel3)
                                    .addComponent(jLabel2)
                                    .addComponent(jLabel4)
                                    .addComponent(jLabel5)
                                    .addComponent(jLabel6)
                                    .addComponent(jLabel7)
                                    .addComponent(jLabel8)
                                    .addComponent(jLabel9)
                                    .addComponent(jLabel10))
                                .addGap(67, 67, 67))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jButton2)
                                .addGap(82, 82, 82)
                                .addComponent(jButton1)
                                .addGap(41, 41, 41)))
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jTextField17, javax.swing.GroupLayout.PREFERRED_SIZE, 161, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jTextField16, javax.swing.GroupLayout.PREFERRED_SIZE, 161, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jTextField14, javax.swing.GroupLayout.PREFERRED_SIZE, 161, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jTextField15, javax.swing.GroupLayout.PREFERRED_SIZE, 161, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jTextField13, javax.swing.GroupLayout.PREFERRED_SIZE, 161, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jTextField6, javax.swing.GroupLayout.PREFERRED_SIZE, 161, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jTextField4, javax.swing.GroupLayout.PREFERRED_SIZE, 161, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jTextField2, javax.swing.GroupLayout.PREFERRED_SIZE, 161, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(111, 111, 111))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 540, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(101, 101, 101))))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(btnView)
                .addGap(32, 32, 32)
                .addComponent(btnViewLease)
                .addGap(212, 212, 212))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(18, 18, 18)
                .addComponent(jLabel1)
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 148, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnView)
                    .addComponent(btnViewLease))
                .addGap(25, 25, 25)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jTextField2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(jTextField4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(16, 16, 16)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel4)
                    .addComponent(jTextField6, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel5)
                    .addComponent(jTextField13, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel6)
                    .addComponent(jTextField15, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel7)
                    .addComponent(jTextField14, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(20, 20, 20)
                        .addComponent(jLabel8))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(18, 18, 18)
                        .addComponent(jTextField16, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel9)
                    .addComponent(jTextField17, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel10)
                        .addGap(26, 26, 26)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jButton1)
                            .addComponent(jButton2)))
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(140, 140, 140))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void btnViewActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnViewActionPerformed
        // TODO add your handling code here:
      int selectedRowIndex = tblperson.getSelectedRow();
    if (selectedRowIndex < 0) {
        JOptionPane.showMessageDialog(this, "Please select a property to view.", "Selection Error", JOptionPane.ERROR_MESSAGE);
        return;
    }
    int propertyId = (Integer) tblperson.getModel().getValueAt(selectedRowIndex, 0);
    fetchPropertyDetails(propertyId);
        //

    }//GEN-LAST:event_btnViewActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        updatePropertyDetails();
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // TODO add your handling code here:

        one.remove(this);
        CardLayout layout=(CardLayout) one.getLayout();
        layout.previous(one);
    }//GEN-LAST:event_jButton2ActionPerformed

    private void btnViewLeaseActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnViewLeaseActionPerformed
        // TODO add your handling code here:
        
        int selectedRowIndex = tblperson.getSelectedRow();
        if (selectedRowIndex < 0) {
            JOptionPane.showMessageDialog(this, "Please select a property.", "Selection Error", JOptionPane.ERROR_MESSAGE);
            return;
        }
        int propertyId = (Integer) tblperson.getModel().getValueAt(selectedRowIndex, 0);
        ViewLeaseJPanel lease = new ViewLeaseJPanel(one,propertyId);
        one.add("ViewLeaseJPanel",lease);
        CardLayout layout =(CardLayout) one.getLayout();
        layout.next(one); 
    }//GEN-LAST:event_btnViewLeaseActionPerformed
private void fetchPropertyDetails(int propertyId) {
    try (Connection conn = JDBC.getConnection()) {
        String sql = "SELECT * FROM PROPERTY WHERE property_id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, propertyId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    // Assuming you have text fields for each property attribute
                    jTextField2.setText(String.valueOf(rs.getInt("property_id")));
                    jTextField4.setText(rs.getString("property_address"));
                    jTextField6.setText(rs.getString("city"));
                    jTextField13.setText(rs.getString("state"));
                    jTextField15.setText(rs.getString("zip"));
                    jTextField14.setText(String.valueOf(rs.getDouble("property_cost")));
                    jTextField16.setText(rs.getString("property_type"));
                    jTextField17.setText(String.valueOf(rs.getInt("square_feet")));
                    jTextArea1.setText(rs.getString("description"));
                }
            }
        }
    } catch (SQLException e) {
        JOptionPane.showMessageDialog(this, "Error fetching property details: " + e.getMessage(), "Database Error", JOptionPane.ERROR_MESSAGE);
    }
}


private void updatePropertyDetails() {
    try (Connection conn = JDBC.getConnection()) {
        int propertyId = Integer.parseInt(jTextField2.getText());
        String propertyAddress = jTextField4.getText();
        double propertyCost = Double.parseDouble(jTextField14.getText());
        String city = jTextField6.getText();
        String state = jTextField13.getText();
        String zipCode = jTextField15.getText();
        String propertyType = jTextField16.getText();
        int squareFeet = Integer.parseInt(jTextField17.getText());
        String description = jTextArea1.getText();

        // Check for null values
        if (propertyAddress.isEmpty() || city.isEmpty() || state.isEmpty() || zipCode.isEmpty() || propertyType.isEmpty() || description.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Please fill in all fields.", "Update Error", JOptionPane.ERROR_MESSAGE);
            return;
        }

        String sql = "UPDATE PROPERTY SET property_address = ?, city = ?, state = ?, zip = ?, " +
                     "property_cost = ?, property_type = ?, square_feet = ?, description = ? " +
                     "WHERE property_id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, propertyAddress);
            pstmt.setString(2, city);
            pstmt.setString(3, state);
            pstmt.setString(4, zipCode);
            pstmt.setDouble(5, propertyCost);
            pstmt.setString(6, propertyType);
            pstmt.setInt(7, squareFeet);
            pstmt.setString(8, description);
            pstmt.setInt(9, propertyId);

            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                JOptionPane.showMessageDialog(this, "Property updated successfully.", "Update Success", JOptionPane.INFORMATION_MESSAGE);
                loadProperties(); // Reload the properties to reflect the update
            } else {
                JOptionPane.showMessageDialog(this, "No property found with ID " + propertyId, "Update Error", JOptionPane.ERROR_MESSAGE);
            }
        }
    } catch (NumberFormatException | SQLException e) {
        JOptionPane.showMessageDialog(this, "Error updating property: " + e.getMessage(), "Database Error", JOptionPane.ERROR_MESSAGE);
        e.printStackTrace(); // Print the stack trace for debugging
    }
}


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnView;
    private javax.swing.JButton btnViewLease;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTextArea jTextArea1;
    private javax.swing.JTextField jTextField13;
    private javax.swing.JTextField jTextField14;
    private javax.swing.JTextField jTextField15;
    private javax.swing.JTextField jTextField16;
    private javax.swing.JTextField jTextField17;
    private javax.swing.JTextField jTextField2;
    private javax.swing.JTextField jTextField4;
    private javax.swing.JTextField jTextField6;
    private javax.swing.JTable tblperson;
    // End of variables declaration//GEN-END:variables
}
