package com.example.marrerami.appfood;

import android.app.Service;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Handler;
import android.preference.DialogPreference;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.Toast;

public class Splash_Screen extends AppCompatActivity {

    private final int duracion_splash = 2000;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash__screen);

        // Validar la conexion  a internet
        if (!isNetworkAvailable()){
            // Alerta de dialogo
            AlertDialog.Builder dialog = new AlertDialog.Builder(Splash_Screen.this);

            dialog.setIcon(R.mipmap.ic_alert_dialog)
                    .setTitle("Error")
                    .setMessage("Revise su conexion a internet.")
                    .setPositiveButton("Reintentar", new DialogInterface.OnClickListener() {
                @Override
                // Reintentar conexion
                public void onClick(DialogInterface dialogInterface, int i) {
                    Intent again = getIntent();
                    finish();
                    startActivity(again);
                }
            })
                    .setNegativeButton("Salir", new DialogInterface.OnClickListener() {
                        @Override
                        // Finalizar app si no hay conexion.
                        public void onClick(DialogInterface dialogInterface, int i) {
                            finish();
                        }
                    });
            // No cancelar, si no es por una respuesta del usuario y mostrar la alerta del dialogo.
            dialog.setCancelable(false).show();
        }
        else
            // Inicio de actividad hacia el MainActivity.
            new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                    Intent splas_screen = new Intent(Splash_Screen.this, MainActivity.class);
                    startActivity(splas_screen);
                    finish();
                }
            }, duracion_splash);
    }

    // Metodo que valida si hay conexion a internet
    private boolean isNetworkAvailable() {
        ConnectivityManager connect = (ConnectivityManager)this.getSystemService(Service.CONNECTIVITY_SERVICE);
        if(connect != null) {
            NetworkInfo activeNewtork = connect.getActiveNetworkInfo();
            if (activeNewtork != null) {
                if (activeNewtork.getState() == NetworkInfo.State.CONNECTED)
                    return true;
            }
        }
        return false;
    }
}
