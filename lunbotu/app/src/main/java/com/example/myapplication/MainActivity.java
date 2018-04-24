package com.example.myapplication;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
    public void onClick(View view){
        switch (view.getId()){
            case R.id.rb_home:
                replaceFragment(new Fragment_shouye());
                break;
            case R.id.rb_classify:
                replaceFragment(new Fragment_fenlei());
                break;
            case R.id.rb_find:
                replaceFragment(new Fragment_guang());
                break;
            case R.id.rb_shopping:
                replaceFragment(new Fragment_gouwuche());
                break;case R.id.rb_my:
                replaceFragment(new Fragment_wode());
                break;
        }
    }
    private void replaceFragment(Fragment fragment){
        FragmentManager fragmentManager = getSupportFragmentManager();
        FragmentTransaction transaction = fragmentManager.beginTransaction();
        transaction.replace(R.id.framelayout,fragment);
        transaction.commit();
    }
}
