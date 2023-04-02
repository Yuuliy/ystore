/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author phanh
 */
public final class Cart {

    List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public Item getItemByProductID(int productID) {
        for (Item item : items) {
            if (item.getProduct().getProductID() == productID) {
                return item;
            }
        }
        return null;
    }

    public int getQuantityByProductID(int productID) {
        return getItemByProductID(productID).getQuantity();
    }

    public double getTotalMoney() {
        double total = 0;
        for (Item item : items) {
            total += item.getTotalMoney();
        }
        return total;
    }


    public String getTotalMoneyFormat() {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat vn = NumberFormat.getInstance(localeVN);
        return vn.format(getTotalMoney());
    }

    public void addItem(Item item) {
        if (getItemByProductID(item.getProduct().getProductID()) != null) {
            Item addItem = getItemByProductID(item.getProduct().getProductID());
            addItem.setQuantity(addItem.getQuantity() + item.getQuantity());
        } else {
            items.add(item);
        }
    }

    public void removeItem(int productID) {
        if (getItemByProductID(productID) != null) {
            items.remove(getItemByProductID(productID));
        }
    }

    private Product getProductByProductID(int productID, List<Product> list) {
        for (Product item : list) {
            if (item.getProductID() == productID) {
                return item;
            }
        }
        return null;
    }

    public Cart(String txt, List<Product> list) {
        items = new ArrayList<>();
        try {

            if (txt != null && txt.length() != 0) {
                //pid _ quantity / color : size - pid_quantity/color:size
                String[] itemLines = txt.split("-");
                //2_1/default:36-3_1/default:S
                for (String itemLine : itemLines) {
                    String[] itemDetails = itemLine.split("_");

                    int id = Integer.parseInt(itemDetails[0]);

                    String[] next = itemDetails[1].split("/");

                    int quantity = Integer.parseInt(next[0]);

                    String[] last = next[1].split(":");

                    String color = last[0];
                    String size = last[1];

                    Product product = getProductByProductID(id, list);

                    Item newItem = new Item(product, product.getPrice(), quantity, color, size);

                    if (getItemByProductID(newItem.getProduct().getProductID()) != null) {
                        Item oldItem = getItemByProductID(newItem.getProduct().getProductID());
                        oldItem.setQuantity(oldItem.getQuantity() + newItem.getQuantity());
                    } else {
                        items.add(newItem);
                    }
                }

            }

        } catch (NumberFormatException e) {
            System.out.println(e);
        }
    }
}
