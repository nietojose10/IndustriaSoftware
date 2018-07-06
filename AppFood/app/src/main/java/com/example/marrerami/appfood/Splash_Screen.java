package com.example.marrerami.appfood;

import android.content.Intent;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

public class Splash_Screen extends AppCompatActivity {

    private final int duracion_splash = 2000;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash__screen);

        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                Intent splas_screen = new Intent(Splash_Screen.this, MainActivity.class);
                startActivity(splas_screen);
                finish();
            }
        }, duracion_splash);
    }
}
