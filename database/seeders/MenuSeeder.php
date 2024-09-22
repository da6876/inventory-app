<?php

namespace Database\Seeders;

use App\Models\Menu\Menu;
use Illuminate\Database\Seeder;

class MenuSeeder extends Seeder
{
    public function run()
    {
        // Insert main menu items
        $dashboard = Menu::create([
            'title' => 'Dashboard',
            'url' => 'index.html',
            'icon' => 'typcn typcn-device-desktop',
            'order' => 1
        ]);

        $uiElements = Menu::create([
            'title' => 'UI Elements',
            'url' => '#',
            'icon' => 'typcn typcn-document-text',
            'order' => 2
        ]);

        $formElements = Menu::create([
            'title' => 'Form elements',
            'url' => '#',
            'icon' => 'typcn typcn-film',
            'order' => 3
        ]);

        $charts = Menu::create([
            'title' => 'Charts',
            'url' => '#',
            'icon' => 'typcn typcn-chart-pie-outline',
            'order' => 4
        ]);

        $tables = Menu::create([
            'title' => 'Tables',
            'url' => '#',
            'icon' => 'typcn typcn-th-small-outline',
            'order' => 5
        ]);

        $icons = Menu::create([
            'title' => 'Icons',
            'url' => '#',
            'icon' => 'typcn typcn-compass',
            'order' => 6
        ]);

        $userPages = Menu::create([
            'title' => 'User Pages',
            'url' => '#',
            'icon' => 'typcn typcn-user-add-outline',
            'order' => 7
        ]);

        // Insert sub-menu items
        Menu::create([
            'title' => 'Buttons',
            'url' => 'pages/ui-features/buttons.html',
            'icon' => '',
            'parent_id' => $uiElements->id,
            'order' => 1
        ]);

        Menu::create([
            'title' => 'Dropdowns',
            'url' => 'pages/ui-features/dropdowns.html',
            'icon' => '',
            'parent_id' => $uiElements->id,
            'order' => 2
        ]);

        Menu::create([
            'title' => 'Typography',
            'url' => 'pages/ui-features/typography.html',
            'icon' => '',
            'parent_id' => $uiElements->id,
            'order' => 3
        ]);

        Menu::create([
            'title' => 'Basic Elements',
            'url' => 'pages/forms/basic_elements.html',
            'icon' => '',
            'parent_id' => $formElements->id,
            'order' => 1
        ]);

        Menu::create([
            'title' => 'ChartJs',
            'url' => 'pages/charts/chartjs.html',
            'icon' => '',
            'parent_id' => $charts->id,
            'order' => 1
        ]);

        Menu::create([
            'title' => 'Basic table',
            'url' => 'pages/tables/basic-table.html',
            'icon' => '',
            'parent_id' => $tables->id,
            'order' => 1
        ]);

        Menu::create([
            'title' => 'Font Awesome',
            'url' => 'pages/icons/font-awesome.html',
            'icon' => '',
            'parent_id' => $icons->id,
            'order' => 1
        ]);

        Menu::create([
            'title' => 'Blank Page',
            'url' => 'pages/samples/blank-page.html',
            'icon' => '',
            'parent_id' => $userPages->id,
            'order' => 1
        ]);

        Menu::create([
            'title' => '404',
            'url' => 'pages/samples/error-404.html',
            'icon' => '',
            'parent_id' => $userPages->id,
            'order' => 2
        ]);

        Menu::create([
            'title' => '500',
            'url' => 'pages/samples/error-500.html',
            'icon' => '',
            'parent_id' => $userPages->id,
            'order' => 3
        ]);

        Menu::create([
            'title' => 'Login',
            'url' => 'pages/samples/login.html',
            'icon' => '',
            'parent_id' => $userPages->id,
            'order' => 4
        ]);

        Menu::create([
            'title' => 'Register',
            'url' => 'pages/samples/register.html',
            'icon' => '',
            'parent_id' => $userPages->id,
            'order' => 5
        ]);
    }
}
